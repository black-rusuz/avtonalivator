import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/loader.dart';
import '../../widgets/sliver_scaffold.dart';
import 'cubit/scan_cubit.dart';
import 'widgets/device_card.dart';
import 'widgets/device_list.dart';

part 'widgets/app_bar.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  void skip(BuildContext context) {
    // context.read<ScanCubit>().skip();
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.accent,
      body: BlocBuilder<ScanCubit, ScanState>(
        builder: builder,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(Strings.skipNow),
        icon: const Icon(Icons.skip_next_rounded),
        onPressed: () => skip(context),
      ),
    );
  }

  Widget builder(BuildContext context, ScanState state) {
    if (state is ScanFulfilled) return _ScanBody(state: state);
    return const Loader();
  }
}

class _ScanBody extends StatelessWidget {
  final ScanFulfilled state;

  const _ScanBody({required this.state});

  void connectToDevice(BuildContext context, UiDevice device) {
    context.read<ScanCubit>().connect(device);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.viewPadding.top;
    final appBar = mediaQuery.size.height * 0.4;

    return RefreshIndicator(
      edgeOffset: appBar + statusBar,
      onRefresh: () async => context.read<ScanCubit>().scan(),
      child: SliverScaffold(
        sliverAppBar: ScanAppBar(isConnecting: false, height: appBar),
        bodyBuilder: (_, c) {
          return DeviceList(
            minHeight: mediaQuery.size.height * 0.6 - statusBar,
            devices: state.devices,
            onItemTap: (device) => connectToDevice(context, device),
          );
        },
      ),
    );
  }
}
