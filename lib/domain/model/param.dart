import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/fragments/settings/provider.dart';
import 'lightning_mode.dart';

class ParamKey {
  static const autoConnect = 'autoConnect';
  static const drinksQuantity = 'drinksQuantity';
  static const calibration = 'calibration';
  static const lightningMode = 'lightningMode';
  static const lightningBrightness = 'lightningBrightness';

  static const typesMap = {
    autoConnect: bool,
    drinksQuantity: int,
    calibration: null,
    lightningMode: LightingMode,
    lightningBrightness: int,
  };
}

class Param extends Equatable {
  final Type? type;
  final String key;
  final String title;
  final String description;
  final dynamic value;
  final Function action;

  const Param._({
    required this.type,
    required this.key,
    required this.title,
    required this.description,
    required this.value,
    required this.action,
  });

  /// Параметр приложения, сохраняемый в телефоне
  factory Param.stored({
    required SettingsProvider provider,
    required String key,
    required String title,
    String? description,
    required dynamic defaultValue,
    ValueChanged<dynamic>? onChanged,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: provider.getParam(key, defaultValue),
      action: (v) {
        provider.setParam(key, v);
        onChanged?.call(v);
      },
    );
  }

  /// Параметр устройства, с диалоговым окном
  factory Param.deviceModal({
    required String key,
    required String title,
    String? description,
    required VoidCallback onTap,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: null,
      action: onTap,
    );
  }

  /// Параметр устройства, для отправки данных
  factory Param.deviceAction({
    required String key,
    required String title,
    String? description,
    required ValueChanged<dynamic> sendValue,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: 0,
      action: sendValue,
    );
  }

  @override
  List<Object?> get props => [
        key,
        title,
        description,
        value,
        action,
      ];
}
