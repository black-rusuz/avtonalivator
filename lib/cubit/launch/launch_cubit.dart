import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit() : super(LaunchInitial());

  void init() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(LaunchAnimate());
    await Future.delayed(const Duration(milliseconds: 1500));
    requestEnable();
  }

  void requestEnable() async {
    emit(LaunchStatus(
      isAvailable: await FlutterBluetoothSerial.instance.isAvailable ?? false,
      isEnabled: await FlutterBluetoothSerial.instance.requestEnable() ?? false,
    ));
  }
}
