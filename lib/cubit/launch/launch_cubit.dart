import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit() : super(LaunchInitial());

  void init() async {
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => emit(LaunchAnimate()),
    );
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => requestEnable(),
    );
  }

  void requestEnable() async {
    emit(LaunchStatus(
      isAvailable: await FlutterBluetoothSerial.instance.isAvailable ?? false,
      isEnabled: await FlutterBluetoothSerial.instance.requestEnable() ?? false,
    ));
  }
}
