import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../domain/model/pump.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../cocktails/cocktails.dart';
import 'provider.dart';
import 'widgets/tuning_card.dart';

export 'provider.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final pumps = context.watch<TuningProvider>().pumps;
    context.read<ConnectionProvider>().updateAll(pumps);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.tuning, style: AppTheme.pageTitle),
      ),
      body: _TuningBody(pumps: pumps),
    );
  }
}

class _TuningBody extends StatelessWidget {
  final List<UiPump> pumps;

  const _TuningBody({required this.pumps});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppTheme.padding,
      itemCount: pumps.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final pump = pumps[index];
    return TuningCard(
      pump: pump,
      setPump: context.read<TuningProvider>().updatePump,
      drinks: context.watch<CocktailsProvider>().drinks,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
