import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/param.dart';
import '../../pages/home/connection_provider.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/settings_card.dart';
import '../../widgets/sliver_scaffold.dart';
import '../tuning/provider.dart';
import 'provider.dart';
import 'widgets/calibration_dialog.dart';

part 'params.dart';
part 'widgets/app_bar.dart';

/// TODO: DISCONNECT AND DEVICE
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
      bodyBuilder: builder,
    );
  }

  Widget builder(BuildContext context, ScrollController controller) {
    final params = _Params(context).list;

    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      padding: AppTheme.listPadding,
      itemCount: params.length,
      itemBuilder: (context, index) {
        final item = params[index];
        return SettingsCard.fromParam(item);
      },
      separatorBuilder: separatorBuilder,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
