import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../domain/connection/device_methods.dart';
import '../../../domain/model/drink.dart';
import '../../strings.dart';
import '../cocktails/cocktails.dart';
import 'provider.dart';
import 'widgets/tuning_card.dart';

export 'provider.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final tuning = context.watch<TuningProvider>();
    final cocktail = tuning.cocktail;
    context.read<DeviceMethods>().setCocktail(cocktail);

    final title = cocktail.name.isNotEmpty ? cocktail.name : Strings.tuning;
    final drinks = cocktail.drinks;

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: AppTheme.pageTitle),
      ),
      body: _TuningBody(drinks: drinks),
    );
  }
}

class _TuningBody extends StatelessWidget {
  final List<UiDrink> drinks;

  const _TuningBody({required this.drinks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppTheme.padding,
      itemCount: drinks.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final drink = drinks[index];
    return TuningCard(
      drink: drink,
      setDrink: context.read<TuningProvider>().updateDrink,
      drinks: context.watch<CocktailsProvider>().drinks,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
