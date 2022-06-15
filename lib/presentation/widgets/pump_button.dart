import 'package:flutter/material.dart';

import '../../style.dart';
import 'common/base_card.dart';

class PumpButton extends StatelessWidget {
  const PumpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: const EdgeInsets.all(20),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.autorenew_rounded, size: 30),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Прокачать помпы', style: Style.cardHeader),
                  Text('Выгнать воздух из системы', style: Style.cardText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
