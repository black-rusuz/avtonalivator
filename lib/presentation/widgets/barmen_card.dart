import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../assets_image.dart';
import 'basic_card.dart';
import 'basic_image.dart';

class BarmenCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final bool isConnecting;

  const BarmenCard({
    super.key,
    this.title,
    this.subtitle,
    this.margin,
    this.onTap,
    this.isConnecting = false,
  });

  bool get isActive => title != null && subtitle != null;

  String get _title =>
      isActive ? 'Автобармен $title' : 'Устройство не подключено';

  String get _hint => isActive
      ? 'Нажмите на карточку,\nчтобы отключить автобармен'
      : 'Нажмите на элемент списка,\nчтобы подключить автобармен';

  AssetsIcon get _image =>
      isActive ? AssetsIcon.barmen : AssetsIcon.barmen_grey;

  static final additional = AppTheme.additional;

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      onTap: onTap,
      padding: const EdgeInsets.all(20),
      color: isActive ? AppTheme.accent : AppTheme.white,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: SizedBox(
                height: 68,
                width: 68,
                child: isConnecting
                    ? CircularProgressIndicator(
                        strokeWidth: 6,
                        color: isActive ? AppTheme.black : AppTheme.greyLight,
                      )
                    : BasicImage(_image.path),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _title,
                    style: AppTheme.text,
                  ),
                  if (isActive)
                    Text(
                      subtitle!,
                      style: additional.copyWith(
                        color: AppTheme.black.withOpacity(0.7),
                      ),
                    ),
                  Text(
                    _hint,
                    style: additional.copyWith(
                      color: isActive ? AppTheme.black.withOpacity(0.7) : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
