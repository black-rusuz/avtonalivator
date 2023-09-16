import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../core/theme.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import 'cubit/scan_cubit.dart';
import 'widgets/device_list.dart';

part 'widgets/app_bar.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

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
        // onPressed: () => context.read<ScanCubit>().skip(),
        onPressed: () {},
      ),
    );
  }

  Widget builder(BuildContext context, ScanState state) {
    final mediaQuery = MediaQuery.of(context);
    final appBarHeight = mediaQuery.size.height * 0.4;

    return RefreshIndicator(
      edgeOffset: mediaQuery.viewPadding.top + appBarHeight,
      onRefresh: () async => context.read<ScanCubit>().scan(),
      child: CustomScrollView(
        slivers: [
          ScanAppBar(
            isConnecting: false,
            height: appBarHeight,
          ),
          SliverToBoxAdapter(
            child: DeviceList(
              devices: List.generate(
                50,
                (index) => BluetoothDevice(
                  name: 'Device $index',
                  address: index.hashCode.toString(),
                ),
              ),
              onItemTap: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
