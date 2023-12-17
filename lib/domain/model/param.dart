import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/fragments/settings/provider.dart';

class ParamKey {
  static const autoConnect = 'autoConnect';
  static const pumpsQuantity = 'pumpsQuantity';
  static const calibration = 'calibration';

  static const typesMap = {
    autoConnect: bool,
    pumpsQuantity: int,
    calibration: null,
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

  factory Param.stored({
    required SettingsProvider provider,
    required String key,
    required String title,
    String? description,
    required dynamic defaultValue,
  }) {
    return Param._(
      type: ParamKey.typesMap[key],
      key: key,
      title: title,
      description: description ?? '',
      value: provider.getParam(key, defaultValue),
      action: (v) => provider.setParam(key, v),
    );
  }

  factory Param.tap({
    required String title,
    String? description,
    required VoidCallback onTap,
  }) {
    final key = UniqueKey();
    return Param._(
      type: ParamKey.typesMap[key],
      key: key.toString(),
      title: title,
      description: description ?? '',
      value: null,
      action: onTap,
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
