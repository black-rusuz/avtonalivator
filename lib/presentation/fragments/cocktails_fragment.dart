import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cocktails/cocktails_cubit.dart';
import '../widgets/cocktail/cocktail_filter.dart';
import '../widgets/cocktail/cocktail_list_item.dart';
import '../widgets/cocktail/cocktail_search.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // TODO:
        const BaseAppBar(title: 'Коктейли'),
        const CocktailSearch(),
        const CocktailFilter(),
        BlocBuilder<CocktailsCubit, CocktailsState>(
          builder: (context, state) {
            if (state is CocktailsFetched) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                sliver: state.cocktails.isEmpty
                    ? const SliverToBoxAdapter(
                        child: Center(child: Text('Нет подходящих коктейлей')),
                      )
                    : SliverWidgetList(
                        children: state.cocktails
                            .map((e) => CocktailListItem(cocktail: e))
                            .toList(),
                      ),
              );
            }
            return const SliverToBoxAdapter(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
