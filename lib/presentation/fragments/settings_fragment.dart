import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/connect/connect_cubit.dart';
import '../../cubit/scan/scan_cubit.dart';
import '../widgets/common/app_bar_actions_loader.dart';
import '../widgets/common/barmen_card.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/scan_device_list.dart';
import '../widgets/common/sliver_widget_list.dart';
import '../widgets/home/settings_pump_button.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectCubit, ConnectState>(
      builder: (context, state) {
        if (state is ConnectInitial) context.read<ScanCubit>().scan();
        return RefreshIndicator(
          edgeOffset: state is ConnectConnected
              ? -150
              : MediaQuery.of(context).viewPadding.top + 244,
          onRefresh: state is ConnectConnected
              ? () async {}
              : () async => context.read<ScanCubit>().scan(),
          child: CustomScrollView(
            slivers: [
              BaseAppBar(
                title: 'Настройки',
                actions: [
                  StreamBuilder(
                    stream: context.read<ScanCubit>().isDiscoveringStream,
                    initialData: false,
                    builder: (_, snapshot) => Center(
                      child: (snapshot.data as bool?) == true
                          ? const AppBarActionsLoader()
                          : null,
                    ),
                  ),
                ],
              ),
              SliverWidgetList(
                children: [
                  BarmenCard(
                    title: state is ConnectConnected ? state.name : null,
                    subtitle: state is ConnectConnected ? state.address : null,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                    isConnecting: state is ConnectConnecting,
                    onTap: state is ConnectConnected
                        ? () {
                            context.read<ConnectCubit>().disconnect();
                            context.read<ScanCubit>().scan();
                          }
                        : null,
                  ),
                  state is ConnectConnected
                      ? const SettingsPumpButton()
                      : BlocBuilder<ScanCubit, ScanState>(
                          buildWhen: ((prev, next) => next is ScanDevices),
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
