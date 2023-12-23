import 'package:injectable/injectable.dart';

import '../model/cocktail.dart';
import '../model/device_data.dart';
import 'connector.dart';

abstract interface class DeviceMethods {
  Stream<DeviceData> get deviceData;

  Future<void> setCocktail(UiCocktail cocktail);

  Future<void> startPour();

  Future<void> stopPour();

  Future<void> calibrate(int weight);

  Future<void> setLightningBrightness(int value);

  Future<void> setLightningMode(int value);
}

@Injectable(as: DeviceMethods)
class FbsDeviceMethods implements DeviceMethods {
  final Connector _connector;

  FbsDeviceMethods(this._connector);

  @override
  Stream<DeviceData> get deviceData {
    return _connector.input;
  }

  @override
  Future<void> setCocktail(UiCocktail cocktail) {
    // TODO: implement startPour
    throw UnimplementedError();
  }

  @override
  Future<void> startPour() {
    // TODO: implement startPour
    throw UnimplementedError();
  }

  @override
  Future<void> stopPour() {
    // TODO: implement stopPour
    throw UnimplementedError();
  }

  @override
  Future<void> calibrate(int weight) {
    // TODO: implement calibrate
    throw UnimplementedError();
  }

  @override
  Future<void> setLightningMode(int value) {
    // TODO: implement setLightningMode
    throw UnimplementedError();
  }

  @override
  Future<void> setLightningBrightness(int value) {
    // TODO: implement setLightningBrightness
    throw UnimplementedError();
  }
}
