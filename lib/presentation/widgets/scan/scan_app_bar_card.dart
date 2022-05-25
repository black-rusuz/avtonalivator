import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/base_card.dart';

class ScanAppBarCard extends StatelessWidget {
  const ScanAppBarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.all(25),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: SvgPicture.asset(
                'assets/barmen_grey.svg',
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
                    'Устройство не подключено',
                    style: Style.cardHeader,
                  ),
                  Text(
                    'Нажмите на карточку, чтобы подключить автобармен',
                    style: Style.cardText,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
