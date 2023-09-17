import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../domain/model/pump.dart';
import '../../strings.dart';
import '../../widgets/loader.dart';
import '../cocktails/cocktails.dart';
import 'bloc/tuning_bloc.dart';
import 'widgets/tuning_card.dart';

export 'bloc/tuning_bloc.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.tuning, style: AppTheme.pageTitle),
      ),
      body: BlocBuilder<TuningBloc, TuningState>(
        builder: builder,
      ),
    );
  }

  Widget builder(BuildContext context, TuningState state) {
    if (state is TuningFulfilled) return _TuningBody(state: state);
    return const Loader();
  }
}

class _TuningBody extends StatelessWidget {
  final TuningFulfilled state;

  const _TuningBody({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemCount: state.pumps.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final pump = state.pumps[index];
    return TuningCard(
      pump: pump,
      setPump: (pump) => setPump(context, pump),
      drinks: context.read<CocktailsProvider>().drinks,
    );
  }

  void setPump(BuildContext context, UiPump pump) {
    final bloc = context.read<TuningBloc>();
    bloc.add(SetPump(pump));
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
