import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../domain/model/pump.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../../widgets/loader.dart';
import '../cocktails/cocktails.dart';
import 'bloc/tuning_bloc.dart';
import 'provider.dart';
import 'widgets/tuning_card.dart';

export 'bloc/tuning_bloc.dart';
export 'provider.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final pumps = context.watch<TuningProvider>().pumps;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.tuning, style: AppTheme.pageTitle),
      ),
      body: _TuningBody(
        state: TuningFulfilled(pumps: pumps),
      ),
    );
  }

  void listener(BuildContext context, TuningState state) {
    if (state is! TuningFulfilled) return;
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
      padding: AppTheme.padding,
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
    context.read<TuningBloc>().add(SetPump(pump));
    context.read<TuningProvider>().updatePump(pump);
    context.read<ConnectionProvider>().updatePump(pump);
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
