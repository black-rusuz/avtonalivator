import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/fragments/settings/provider.dart';

class ParamKey {
  static const autoConnect = 'autoConnect';
  static const pumpsQuantity = 'pumpsQuantity';
}

class Param extends Equatable {
  final String key;
  final String title;
  final String? description;
  final dynamic value;
  final Function onTap;

  const Param._({
    required this.key,
    required this.title,
    this.description,
    this.value,
    required this.onTap,
  });

  factory Param.stored({
    required SettingsProvider provider,
    required String key,
    required String title,
    String? description,
    required dynamic defaultValue,
  }) {
    return Param._(
      key: key,
      title: title,
      value: provider.getParam(key, defaultValue),
      onTap: (v) => provider.setParam(key, v),
    );
  }

  factory Param.action({
    required String title,
    String? description,
    required VoidCallback onTap,
  }) {
    final key = UniqueKey();
    return Param._(
      key: key.toString(),
      title: title,
      description: description,
      onTap: onTap,
    );
  }

  @override
  List<Object?> get props => [
        key,
        title,
        description,
        value,
        onTap,
      ];
}
