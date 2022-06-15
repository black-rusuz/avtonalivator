import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/connect/connect_cubit.dart';
import '../../cubit/scan/scan_cubit.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';
import '../widgets/pump_button.dart';
import '../widgets/scan/scan_app_bar_card.dart';
import '../widgets/scan/scan_device_list.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Настройки'),
        BlocBuilder<ConnectCubit, ConnectState>(
          builder: (context, state) {
            if (state is ConnectionSuccess) {
              return SliverWidgetList(
                children: [
                  ScanAppBarCard(
                    title: state.name,
                    subtitle: state.address,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                  ),
                  const PumpButton(),
                ],
              );
            }
            return SliverWidgetList(
              children: [
                const ScanAppBarCard(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 50),
                ),
                BlocBuilder<ScanCubit, ScanState>(
                  builder: (context, state) {
                    return ScanDeviceList(
                      devices: state is ScanDevices ? state.devices : [],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
