import '../../style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/scan/scan_cubit.dart';
import 'common/app_bar_actions_loader.dart';
import 'common/barmen_card.dart';

class ScanAppBar extends StatelessWidget {
  const ScanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: 60,
      expandedHeight: 260,
      title: Text('Подключение', style: Style.pageTitle),
      actions: [
        StreamBuilder<bool>(
          stream: context.read<ScanCubit>().isDiscoveringStream,
          initialData: false,
          builder: (_, snapshot) => Center(
            child: snapshot.data == true ? const AppBarActionsLoader() : null,
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: BlocBuilder<ScanCubit, ScanState>(
            buildWhen: ((prev, next) => next is ScanConnecting),
            builder: (context, state) {
              return BarmenCard(
                margin: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                isConnecting: state is ScanConnecting,
              );
            },
          ),
        ),
      ),
    );
  }
}
