import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/connection/connector.dart';
import '../../../../domain/logger.dart';
import '../../../../domain/model/device.dart';
import '../../../../domain/storage/settings.dart';

part 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  final SettingsBox _settings;
  final Connector _connector;

  ScanCubit(this._settings, this._connector) : super(ScanInitial()) {
    scan();
  }

  final List<UiDevice> _devices = [];
  StreamSubscription? _devicesSub;

  Future<void> scan() async {
    _devices.clear();
    emit(ScanFulfilled(devices: _devices));

    _devicesSub?.cancel();
    _devicesSub = _connector.devices.listen(_addDevice);
  }

  Future<void> connect(UiDevice device) async {
    emit(ScanFulfilled(devices: _devices, isConnecting: true));
    final success = await _connector.connect(device);

    if (success) {
      _settings.lastDevice = device;
      emit(ScanConnected());
    } else {
      Logger.log('Scan error', ScanError(), StackTrace.current);
      emit(ScanError());
      emit(ScanFulfilled(devices: _devices));
    }
  }

  Stream<bool> get isDiscovering => _connector.isDiscovering;

  // * Private

  bool get _autoConnect => _settings.autoConnect;

  void _addDevice(UiDevice device) async {
    final duplicate = _devices.contains(device);
    final isLast = device == _settings.lastDevice;

    if (!duplicate) {
      if (isLast) {
        _devices.insert(0, device);
        if (_autoConnect) {
          await connect(device);
        } else {
          emit(ScanLastFound(device));
        }
      } else {
        _devices.add(device);
      }
    }

    emit(ScanFulfilled(devices: _devices));
  }

  @override
  Future<void> close() async {
    await _connector.cancelDiscovery();
    await _devicesSub?.cancel();
    return super.close();
  }
}
