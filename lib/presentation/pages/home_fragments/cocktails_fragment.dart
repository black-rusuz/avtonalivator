import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cocktails/cocktails_bloc.dart';
import '../../widgets/cocktail/cocktail_list_item.dart';
import '../../widgets/common/base_app_bar.dart';
import '../../widgets/common/sliver_widget_list.dart';
import '../../widgets/home/filter_ready_button.dart';
import '../../widgets/home/search_text_field.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsBloc, CocktailsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            // TODO:
            const BaseAppBar(title: 'Коктейли'),
            const SearchTextField(),
            const FilterReadyButton(),
            state is! CocktailsFetchedState
                ? const SliverToBoxAdapter(child: CircularProgressIndicator())
                : state.cocktails.isEmpty
                    ? const SliverToBoxAdapter(child: Text('empty'))
                    : SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        sliver: SliverWidgetList(
                          children: state.cocktails
                              .map((e) => CocktailListItem(cocktail: e))
                              .toList(),
                        ),
                      ),
          ],
        );
      },
    );
  }
}
