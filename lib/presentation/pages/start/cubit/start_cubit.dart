import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

part 'start_state.dart';

const _duration = Duration(milliseconds: 500);

@injectable
class StartCubit extends Cubit<StartState> {
  final bluetooth = FlutterBluetoothSerial.instance;

  StartCubit() : super(StartInitial());

  bool _available = false;
  bool _enabled = false;

  Future<void> init() async {
    await _animate();
    await _launch();
  }

  Future<void> _animate() async {
    await Future.delayed(_duration);
    emit(StartAnimate());
  }

  Future<void> _launch() async {
    await Future.delayed(_duration);
    _available = await bluetooth.isAvailable ?? false;
    _enabled = await bluetooth.requestEnable() ?? false;
    emit(StartFulfilled(btAvailable: _available, btEnabled: _enabled));
  }

  Future<void> requestEnable() async {
    _enabled = await bluetooth.requestEnable() ?? false;
    emit(StartFulfilled(btAvailable: _available, btEnabled: _enabled));
  }
}
