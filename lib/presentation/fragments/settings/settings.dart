import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/param.dart';
import '../../connection/connection_cubit.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/basic_card.dart';
import '../../widgets/loader.dart';
import '../../widgets/sliver_scaffold.dart';
import 'cubit/settings_cubit.dart';
import 'widgets/settings_card.dart';

export 'cubit/settings_cubit.dart';

part 'widgets/app_bar.dart';

void _disconnect(BuildContext context) {
  final cubit = context.read<ConnectionCubit>();
  cubit.disconnect();
}

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: builder,
    );
  }

  Widget builder(BuildContext context, SettingsState state) {
    final appBar = MediaQuery.of(context).size.height * 0.4;
    const device = UiDevice(name: 'Aboba', address: '00.00.11.20');

    return SliverScaffold(
      sliverAppBar: SettingsAppBar(
        height: appBar,
        isConnecting: false,
        device: device,
        onTap: () => _disconnect(context),
      ),
      body: state is! SettingsFulfilled ? const Loader() : null,
      bodyBuilder: state is SettingsFulfilled
          ? (_, controller) {
              return _SettingsList(
                notConnected: true,
                controller: controller,
                params: state.params,
              );
            }
          : null,
    );
  }
}

class _SettingsList extends StatelessWidget {
  final bool notConnected;
  final ScrollController controller;
  final List<Param> params;

  const _SettingsList({
    required this.notConnected,
    required this.controller,
    required this.params,
  });

  int get count => notConnected ? params.length + 1 : params.length;

  void goConnect(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.scan);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      padding: AppTheme.listPadding,
      itemCount: count,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (notConnected && index == 0) {
      return BasicCard(
        padding: AppTheme.padding,
        color: AppTheme.accent,
        onTap: () => goConnect(context),
        child: const Text(Strings.connection),
      );
    }
    index -= 1;

    final item = params[index];
    return SettingsCard(param: item);
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
