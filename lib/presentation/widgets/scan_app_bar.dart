import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/scan/scan_cubit.dart';
import 'common/barmen_card.dart';

class ScanAppBar extends StatelessWidget {
  const ScanAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanCubit, ScanState>(
      buildWhen: ((prev, next) => next is ScanProcessing),
      builder: (context, state) {
        return SliverAppBar(
          centerTitle: true,
          collapsedHeight: 60,
          expandedHeight: 260,
          title: Text('Подключение', style: Style.pageTitle),
          actions: state is ScanProcessing && state.isDiscovering
              ? [
                  Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.all(12),
                      child: const CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                ]
              : null,
          flexibleSpace: FlexibleSpaceBar(
            background: Center(
              child: BarmenCard(
                margin: const EdgeInsets.only(top: 50),
                isConnecting: state is ScanProcessing && state.isConnecting,
              ),
            ),
          ),
        );
      },
    );
  }
}
