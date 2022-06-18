import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cocktails/cocktails_cubit.dart';
import 'cocktails_list_item.dart';

class CocktailsList extends StatelessWidget {
  const CocktailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsCubit, CocktailsState>(
      builder: (context, state) {
        if (state is CocktailsFetched) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: state.cocktails.isEmpty
                ? const Center(
                    heightFactor: 15,
                    child: Text('Нет подходящих коктейлей'),
                  )
                : Column(
                    children: state.cocktails
                        .map((e) => CocktailsListItem(cocktail: e))
                        .toList(),
                  ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
