import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../strings.dart';
import '../../widgets/sliver_scaffold.dart';
import '../tuning/bloc/tuning_bloc.dart';
import 'widgets/settings_card.dart';

part 'widgets/app_bar.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuningBloc, TuningState>(
      builder: builder,
    );
  }

  Widget builder(BuildContext context, TuningState state) {
    return SliverScaffold(
      sliverAppBar: const _SettingsAppBar(),
      bodyBuilder: (_, controller) {
        return ListView.separated(
          shrinkWrap: true,
          controller: controller,
          padding: AppTheme.listPadding,
          itemCount: 20,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
        );
      },
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return const SettingsCard();
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
