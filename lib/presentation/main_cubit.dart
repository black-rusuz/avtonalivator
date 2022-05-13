import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial()) {
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
    emit(MainStatus(isAvailable: isAvailable, isEnabled: isEnabled));
  }
}
