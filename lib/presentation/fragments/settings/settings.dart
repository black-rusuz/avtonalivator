import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/param.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/settings_card.dart';
import '../../widgets/sliver_scaffold.dart';
import 'provider.dart';

part 'widgets/app_bar.dart';
part 'widgets/list.dart';

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
