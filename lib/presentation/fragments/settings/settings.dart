import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../domain/model/device.dart';
import '../../../domain/model/param.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../../widgets/barmen_card.dart';
import '../../widgets/loader.dart';
import '../../widgets/sliver_scaffold.dart';
import 'cubit/settings_cubit.dart';
import 'widgets/settings_card.dart';

export 'cubit/settings_cubit.dart';

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
    return BlocBuilder<SettingsCubit, SettingsState>(builder: builder);
  }

  Widget builder(BuildContext context, SettingsState state) {
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
      body: state is! SettingsFulfilled ? const Loader() : null,
      bodyBuilder: (_, __) {
        if (state is SettingsFulfilled) {
          return _SettingsList(params: state.params);
        }
        return const SizedBox();
      },
    );
  }
}

class _SettingsList extends StatelessWidget {
  final List<Param> params;

  const _SettingsList({required this.params});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: PrimaryScrollController.maybeOf(context),
      padding: AppTheme.listPadding,
      itemCount: params.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = params[index];
    return SettingsCard(param: item);
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
