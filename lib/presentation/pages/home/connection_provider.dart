import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/connection/connector.dart';
import '../../../domain/connection/device_methods.dart';
import '../../../domain/logger.dart';
import '../../../domain/model/cocktail.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/device_data.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final DeviceMethods _methods;
  final Connector _connector;

  ConnectionProvider(this._methods, this._connector) {
    device = _connector.device;
    _inputSub?.cancel();
    _inputSub = _methods.deviceData.map(_inputPrinter).listen(_inputListener);
  }

  UiDevice? device;
  DeviceData data = const DeviceData();
  StreamSubscription? _inputSub;

  List<String> _drinks = [];

  String? get drink {
    final index = data.step - 1;
    if (index < 0) return null;
    return _drinks.elementAtOrNull(index);
  }

  // * Init

  DeviceData _inputPrinter(DeviceData data) {
    Logger.log(data);
    return data;
  }

  void _inputListener(DeviceData data) {
    this.data = data;
    notifyListeners();
  }

  // * Methods

  Future<void> setCocktail(UiCocktail cocktail) {
    _drinks = cocktail.drinkNames;
    return _methods.setCocktail(cocktail);
  }

  Future<void> startPour() {
    _inputListener(data.copyWith(step: 1));
    return _methods.startPour();
  }

  Future<void> stopPour() {
    return _methods.stopPour();
  }

  Future<void> calibrate(int weight) {
    return _methods.calibrate(weight);
  }

  // * Helpers

  Future<void> disconnect() {
    device = null;
    notifyListeners();
    return _connector.disconnect();
  }

  @override
  void dispose() {
    _inputSub?.cancel();
    return super.dispose();
  }
}
