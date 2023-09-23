import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'launch_state.dart';

const _duration = Duration(milliseconds: 1000);

@injectable
class LaunchCubit extends Cubit<LaunchState> {
  final _serial = FlutterBluetoothSerial.instance;
  final _status = Permission.bluetooth;
  final _scan = Permission.bluetoothScan;

  LaunchCubit() : super(LaunchInitial()) {
    _init();
  }

  bool _hasPermission = false;
  bool _isAvailable = false;
  bool _isEnabled = false;

  Future<void> requestEnable() async {
    _isEnabled = await _serial.requestEnable() ?? false;
    final state = _isEnabled ? LaunchGoScan() : _fullState;
    emit(state);
  }

  Future<void> _init() async {
    await _animate();
    await _requestPermission();
    await _checkBluetooth();
  }

  // * State emitters

  Future<void> _animate() async {
    await Future.delayed(_duration);
    emit(LaunchAnimate());
    await Future.delayed(_duration);
  }

  Future<void> _requestPermission() async {
    var permission = await _scan.status;
    _hasPermission = permission.isGranted;

    try {
      permission = await _scan.request();
      _hasPermission = permission.isGranted;
    } catch (_) {
      // TODO: log
    }
  }

  Future<void> _checkBluetooth() async {
    final status = await _status.serviceStatus;
    _isAvailable = !status.isNotApplicable;
    _isEnabled = status.isEnabled;

    if (_hasPermission) {
      if (_isEnabled) {
        emit(LaunchGoScan());
      } else {
        await requestEnable();
      }
    } else {
      emit(_fullState);
    }
  }

  LaunchStatus get _fullState => LaunchStatus(
        noPermission: !_hasPermission,
        notAvailable: !_isAvailable,
        enabled: _isEnabled,
      );
}
