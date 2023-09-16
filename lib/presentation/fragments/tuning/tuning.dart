import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/tuning_bloc.dart';
import 'widgets/tuning_card.dart';

export 'bloc/tuning_bloc.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuningBloc, TuningState>(
      builder: builder,
    );
  }

  Widget builder(BuildContext context, TuningState state) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      itemCount: 8,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return const TuningCard();
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
