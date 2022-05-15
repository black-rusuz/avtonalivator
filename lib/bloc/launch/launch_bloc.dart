import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

part 'launch_event.dart';

part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc() : super(LaunchInitialState()) {
    on<LaunchInitialEvent>(_init);
  }

  FutureOr<void> _init(
    LaunchInitialEvent event,
    Emitter<LaunchState> emit,
  ) async {
    emit(LaunchStatusFetchedState(
      isAvailable: await FlutterBluetoothSerial.instance.isAvailable ?? false,
      isEnabled: await FlutterBluetoothSerial.instance.requestEnable() ?? false,
    ));
  }
}
