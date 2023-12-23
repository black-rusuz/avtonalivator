import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../assets_image.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/basic_card.dart';
import '../../widgets/basic_image.dart';
import '../../widgets/sliver_scaffold.dart';
import 'cubit/scan_cubit.dart';
import 'widgets/device_list.dart';

export 'cubit/scan_cubit.dart';

part 'widgets/app_bar.dart';

part 'widgets/known_device.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  void skip(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  void connect(BuildContext context, UiDevice device) {
    context.read<ScanCubit>().connect(device);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.accent,
      body: BlocConsumer<ScanCubit, ScanState>(
        buildWhen: (prev, next) => next is ScanFulfilled,
        builder: builder,
        listenWhen: (prev, next) =>
            next is ScanLastFound || next is ScanConnected || next is ScanError,
        listener: listener,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(Strings.skipNow),
        icon: const Icon(Icons.skip_next_rounded),
        onPressed: () => skip(context),
      ),
    );
  }

  Widget builder(BuildContext context, ScanState state) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.viewPadding.top;
    final appBar = mediaQuery.size.height * 0.4;

    state = state as ScanFulfilled;

    return RefreshIndicator(
      edgeOffset: appBar + statusBar,
      onRefresh: () async => context.read<ScanCubit>().scan(),
      child: SliverScaffold(
        sliverAppBar: ScanAppBar(
          isConnecting: state.isConnecting,
          height: appBar,
        ),
        body: DeviceList(
          minHeight: mediaQuery.size.height * 0.6 - statusBar,
          devices: state.devices,
          onItemTap: (device) => connect(context, device),
        ),
      ),
    );
  }

  void listener(BuildContext context, ScanState state) {
    final navigator = Navigator.of(context);

    if (state is ScanConnected) {
      navigator.pushReplacementNamed(AppRoutes.home);
    } else if (state is ScanError) {
      showDialog(context: context, builder: errorBuilder);
    } else if (state is ScanLastFound) {
      final device = state.knownDevice;
      showModalBottomSheet(
        context: context,
        builder: (_) => _KnownDeviceSheet(
          device: device,
          onTap: () {
            connect(context, device);
            navigator.pop();
          },
        ),
      );
    }
  }

  Widget errorBuilder(BuildContext context) {
    return const AlertDialog(
      title: Text(Strings.connectionError),
      content: Icon(
        Icons.wifi_tethering_error_outlined,
        size: 48,
        color: AppTheme.error,
      ),
    );
  }
}
