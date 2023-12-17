import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../domain/model/param.dart';
import 'basic_card.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? right;
  final Widget? bottom;
  final VoidCallback? onTap;

  const SettingsCard._({
    required this.title,
    required this.description,
    this.right,
    this.bottom,
    this.onTap,
  });

  factory SettingsCard.fromParam(Param param) {
    return switchType(param);
  }

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      onTap: () => onTap?.call(),
      padding: AppTheme.padding,
      color: AppTheme.background,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTheme.additional,
                  ),
                ],
                if (bottom != null) ...[
                  const SizedBox(height: 8),
                  bottom!,
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (right != null) right!,
        ],
      ),
    );
  }

  static SettingsCard switchType(Param param) {
    switch (param.type) {
      case int:
        return SettingsCard._(
          title: param.title,
          description: param.description,
          bottom: Slider(
            min: 0,
            max: 12,
            value: (param.value as num).toDouble(),
            onChanged: (v) => param.action(v),
          ),
        );
      case bool:
        return SettingsCard._(
          title: param.title,
          description: param.description,
          right: Checkbox(
            value: param.value as bool,
            onChanged: (v) => param.action(v),
          ),
        );
      case null:
        return SettingsCard._(
          title: param.title,
          description: param.description,
          onTap: () => param.action(),
        );
      default:
        throw UnimplementedError();
    }
  }
}
