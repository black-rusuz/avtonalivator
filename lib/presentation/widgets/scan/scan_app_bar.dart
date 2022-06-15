import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/scan/scan_cubit.dart';
import 'scan_app_bar_card.dart';

class ScanAppBar extends StatelessWidget {
  const ScanAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: 60,
      expandedHeight: 260,
      title: Text('Подключение', style: Style.pageTitle),
      actions: [
        StreamBuilder(
          stream: context.read<ScanCubit>().isDiscoveringStream,
          builder: (_, snapshot) => Center(
            child: (snapshot.data as bool?) == false
                ? null
                : Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.all(12),
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 3,
                    ),
                  ),
          ),
        ),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(child: ScanAppBarCard()),
        ),
      ),
    );
  }
}
