import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitialState()) {
    fetchStatus();
  }

  Future fetchStatus() async {
    bool isAvailable =
        await FlutterBluetoothSerial.instance.isAvailable ?? false;
    bool isEnabled = await FlutterBluetoothSerial.instance.isEnabled ?? false;

    if (!isEnabled) {
      isEnabled =
          await FlutterBluetoothSerial.instance.requestEnable() ?? false;
    }

    emit(StatusSuccessState(isAvailable: isAvailable, isEnabled: isEnabled));
  }
}
