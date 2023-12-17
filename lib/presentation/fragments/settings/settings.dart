import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/sliver_scaffold.dart';
import 'widgets/settings_card.dart';
part 'widgets/app_bar.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  void disconnect(BuildContext context) {
    context.read<ConnectionProvider>().disconnect();
  }

  void goScan(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.scan);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = MediaQuery.of(context).size.height * 0.4;
    final device = context.watch<ConnectionProvider>().device;
    final action =
        device == null ? () => goScan(context) : () => disconnect(context);

    return SliverScaffold(
      sliverAppBar: SettingsAppBar(
        height: appBar,
        isConnecting: false,
        device: device,
        onTap: action,
      ),
      bodyBuilder: (_, __) => const _SettingsList(),
    );
  }
}

class _SettingsList extends StatelessWidget {
  const _SettingsList();

  @override
  Widget build(BuildContext context) {
    final params = [];

    return ListView.separated(
      shrinkWrap: true,
      controller: PrimaryScrollController.maybeOf(context),
      padding: AppTheme.listPadding,
      itemCount: params.length,
      itemBuilder: (context, index) {
        final item = params[index];
        return SettingsCard(param: item);
      },
      separatorBuilder: separatorBuilder,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
