import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit() : super(LaunchInitial());

  Future<void> init() async {
    if (state is LaunchInitial) {
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(LaunchAnimate());
      await Future.delayed(const Duration(milliseconds: 1500));
    }
    emit(LaunchStatus(
      isAvailable: await FlutterBluetoothSerial.instance.isAvailable ?? false,
      isEnabled: await FlutterBluetoothSerial.instance.requestEnable() ?? false,
    ));
  }
}
