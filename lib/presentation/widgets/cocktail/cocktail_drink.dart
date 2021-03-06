import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

import '../common/base_divider.dart';

class CocktailDrink extends StatelessWidget {
  final String name;
  final int volume;

  const CocktailDrink({
    Key? key,
    required this.name,
    required this.volume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseDivider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          minLeadingWidth: 0,
          leading: const Icon(Icons.local_drink_rounded),
          title: Text(name),
          trailing: Text('$volumeмл', style: Style.textLight),
        ),
        const BaseDivider(),
      ],
    );
  }
}
