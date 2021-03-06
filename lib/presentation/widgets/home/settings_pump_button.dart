import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/connect/connect_cubit.dart';
import '../common/base_card.dart';

class SettingsPumpAirButton extends StatelessWidget {
  const SettingsPumpAirButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: const EdgeInsets.all(20),
      onTap: () => context.read<ConnectCubit>().sendPumpAir(),
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
                  Text('Прокачать помпы', style: Style.text),
                  Text('Выгнать воздух из системы', style: Style.additional),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
