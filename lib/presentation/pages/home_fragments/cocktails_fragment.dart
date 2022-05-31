import 'package:flutter/material.dart';

import '../../widgets/common/base_app_bar.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Коктейли'),
        SliverToBoxAdapter(
          child: Container(
            height: 1000,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
