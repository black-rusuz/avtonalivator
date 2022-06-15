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
    return BlocBuilder<ConnectCubit, ConnectState>(
      builder: (context, state) {
        return RefreshIndicator(
          edgeOffset: state is ConnectSuccess ? -100 : 274,
          onRefresh: state is ConnectSuccess
              ? () async {}
              : () => context.read<ScanCubit>().init(),
          child: CustomScrollView(
            slivers: [
              const BaseAppBar(title: 'Настройки'),
              SliverWidgetList(
                children: [
                  ScanAppBarCard(
                    title: state is ConnectSuccess ? state.name : null,
                    subtitle: state is ConnectSuccess ? state.address : null,
                    onTap: state is ConnectSuccess
                        ? () => context.read<ConnectCubit>().disconnect()
                        : null,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                  ),
                  state is ConnectSuccess
                      ? const PumpButton()
                      : BlocBuilder<ScanCubit, ScanState>(
                          builder: (context, state) {
                            return ScanDeviceList(
                              devices:
                                  state is ScanDevices ? state.devices : [],
                              directly: true,
                            );
                          },
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
