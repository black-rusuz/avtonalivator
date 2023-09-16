import 'package:flutter/cupertino.dart';

import '../strings.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Strings.cocktails),
    );
  }
}
