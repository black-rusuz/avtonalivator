import 'package:flutter/material.dart';

import '../../widgets/common/base_app_bar.dart';
import '../../widgets/common/sliver_widget_list.dart';
import '../../widgets/home/filter_ready_button.dart';
import '../../widgets/home/search_text_field.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        // TODO:
        BaseAppBar(title: 'Коктейли'),
        SearchTextField(),
        FilterReadyButton(),
        SliverWidgetList(children: []),
      ],
    );
  }
}
