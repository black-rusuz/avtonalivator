import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../strings.dart';
import 'cubit/scan_cubit.dart';
import 'widgets/device_list.dart';

part 'widgets/app_bar.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.accent,
      body: RefreshIndicator(
        edgeOffset: MediaQuery.of(context).viewPadding.top + 260,
        onRefresh: () async => context.read<ScanCubit>().scan(),
        child: CustomScrollView(
          slivers: [
            const ScanAppBar(),
            SliverToBoxAdapter(
              child: DeviceList(
                items: List.generate(50, (index) => index),
                onItemTap: (value) {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(Strings.skipNow),
        icon: const Icon(Icons.skip_next_rounded),
        // onPressed: () => context.read<ScanCubit>().skip(),
        onPressed: () {},
      ),
    );
  }
}
