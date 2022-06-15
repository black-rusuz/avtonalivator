import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/base_card.dart';

class ScanAppBarCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsets? margin;
  final void Function()? onTap;

  const ScanAppBarCard({
    Key? key,
    this.title,
    this.subtitle,
    this.margin,
    this.onTap,
  }) : super(key: key);

  bool get isActive => title != null && subtitle != null;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      isActive: isActive,
      duration: 200,
      margin: margin,
      padding: const EdgeInsets.all(25),
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: SvgPicture.asset(
                isActive ? 'assets/barmen.svg' : 'assets/barmen_grey.svg',
                height: 68,
                width: 69.26,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isActive ? 'Автобармен $title' : 'Устройство не подключено',
                    style: Style.cardHeader,
                  ),
                  if (isActive)
                    Text(
                      subtitle!,
                      style: Style.cardText.copyWith(
                        color: Style.switchEnabled.withOpacity(0.7),
                      ),
                    ),
                  isActive
                      ? Text(
                          'Нажмите на карточку,\nчтобы отключить автобармен',
                          style: Style.cardText.copyWith(
                            color: Style.switchEnabled.withOpacity(0.7),
                          ),
                        )
                      : Text(
                          'Нажмите на элемент списка,\nчтобы подключить автобармен',
                          style: Style.cardText,
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
