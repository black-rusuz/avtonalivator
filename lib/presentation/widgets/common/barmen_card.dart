import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'base_card.dart';

class BarmenCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsets? margin;
  final void Function()? onTap;
  final bool isConnecting;

  const BarmenCard({
    Key? key,
    this.title,
    this.subtitle,
    this.margin,
    this.onTap,
    this.isConnecting = false,
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
              child: SizedBox(
                height: 68,
                width: 68,
                child: isConnecting
                    ? CircularProgressIndicator(
                        strokeWidth: 6,
                        color: isActive ? Style.black : Style.greyLight,
                      )
                    : SvgPicture.asset(
                        isActive
                            ? 'assets/barmen.svg'
                            : 'assets/barmen_grey.svg',
                      ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isActive ? 'Автобармен $title' : 'Устройство не подключено',
                    style: Style.text,
                  ),
                  if (isActive)
                    Text(
                      subtitle!,
                      style: Style.additional.copyWith(
                        color: Style.black.withOpacity(0.7),
                      ),
                    ),
                  isActive
                      ? Text(
                          'Нажмите на карточку,\nчтобы отключить автобармен',
                          style: Style.additional.copyWith(
                            color: Style.black.withOpacity(0.7),
                          ),
                        )
                      : Text(
                          'Нажмите на элемент списка,\nчтобы подключить автобармен',
                          style: Style.additional,
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
