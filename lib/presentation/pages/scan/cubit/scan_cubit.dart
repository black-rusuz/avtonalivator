import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/connector.dart';
import '../../../../data/storage/settings.dart';
import '../../../../domain/model/device.dart';

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

  List<UiDevice> devices = [];
  StreamSubscription? devicesSubscription;

  Future<void> scan() async {
    devices.clear();
    devicesSubscription?.cancel();
    devicesSubscription =
        _connector.devices.map(UiDevice.fromLib).listen(_addDevice);
  }

  Future<void> tryConnectToLast() async {
    // TODO: last device
    // final lastDevice = _settings.lastDevice;
    final lastDevice = await Future<UiDevice?>.value();
    if (lastDevice != null) return connect(lastDevice);
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
