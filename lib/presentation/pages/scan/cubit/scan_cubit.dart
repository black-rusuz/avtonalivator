import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/connector.dart';
import '../../../../domain/model/device.dart';
import '../../../../domain/storage/settings.dart';

part 'scan_state.dart';

const _streamDuration = Duration(milliseconds: 400);

@injectable
class ScanCubit extends Cubit<ScanState> {
  final SettingsBox _settings;
  final Connector _connector;

  ScanCubit(this._settings, this._connector) : super(ScanInitial()) {
    scan();
    tryConnectToLast();
  }

  bool get _autoConnect => _settings.autoConnect;

  List<UiDevice> devices = [];
  StreamSubscription? devicesSubscription;

  Future<void> scan() async {
    devices.clear();
    devicesSubscription?.cancel();
    devicesSubscription =
        _connector.devices.map(UiDevice.fromLib).listen(_addDevice);
  }

  Future<void> tryConnectToLast() async {
    final knownDevice = _settings.lastDevice;

    if (knownDevice != null) {
      final state = AutoConnect(knownDevice, _autoConnect);
      emit(state);

      if (_autoConnect) return connect(knownDevice);
    }
  }

  Future<void> connect(UiDevice device) async {
    final libDevice = device.toLib();
    final connection = await _connector.connect(libDevice);
    if (connection == null) {
      // emit(ConnectionError)
    } else {
      // emit(ConnectionSuccess);
    }
  }

  Stream<bool> get isDiscovering async* {
    while (!isClosed) {
      yield await Future.delayed(_streamDuration, _streamCallback);
    }
  }

  void _addDevice(UiDevice device) async {
    final contains = devices.contains(device);
    if (!contains) devices.add(device);
    emit(ScanFulfilled(devices: devices));
  }

  Future<bool> _streamCallback() => _connector.isDiscovering;

  @override
  Future<void> close() async {
    await _connector.cancelDiscovery();
    await devicesSubscription?.cancel();
    return super.close();
  }
}
