import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/connect/connect_cubit.dart';
import '../../cubit/scan/scan_cubit.dart';
import '../widgets/common/barmen_card.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/scan_device_list.dart';
import '../widgets/common/sliver_widget_list.dart';
import '../widgets/pump_button.dart';

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
              BaseAppBar(
                title: 'Настройки',
                actions: [
                  StreamBuilder(
                    stream: context.read<ScanCubit>().isDiscoveringStream,
                    initialData: false,
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
              ),
              SliverWidgetList(
                children: [
                  BarmenCard(
                    title: state is ConnectSuccess ? state.name : null,
                    subtitle: state is ConnectSuccess ? state.address : null,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                    isConnecting: state is ConnectProcessing,
                    onTap: state is ConnectSuccess
                        ? () {
                            context.read<ConnectCubit>().disconnect();
                            context.read<ScanCubit>().init();
                          }
                        : null,
                  ),
                  state is ConnectSuccess
                      ? const PumpButton()
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
