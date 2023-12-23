import '../model/cocktail.dart';

abstract interface class DeviceMethods {
  Stream<DeviceData> get deviceData;

  Future<void> setCocktail(UiCocktail cocktail);

  Future<void> startPour();

  Future<void> stopPour();

  Future<void> calibrate(int weight);

  Future<void> setLightningBrightness(int value);

  Future<void> setLightningMode(int value);
}

// @Injectable(as: deviceMethods)
// class FbsDeviceMethods implements DeviceMethods {}
