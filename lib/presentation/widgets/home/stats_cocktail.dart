import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

import '../common/base_divider.dart';

class StatsCocktail extends StatelessWidget {
  final String name;
  final int? count;
  final int? daysAgo;

  const StatsCocktail({
    Key? key,
    required this.name,
    this.count,
    this.daysAgo,
  })  : assert(count != null || daysAgo != null),
        super(key: key);

  String get countWord {
    switch (count! % 100) {
      case 12:
      case 13:
      case 14:
        return ' раз';
    }
    switch (count! % 10) {
      case 0:
      case 1:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return ' раз';
      case 2:
      case 3:
      case 4:
        return ' раза';
    }
    return ' раз';
  }

  String get daysWord {
    switch (daysAgo! % 100) {
      case 11:
      case 12:
      case 13:
      case 14:
        return ' дней назад';
    }
    switch (daysAgo! % 10) {
      case 0:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return ' дней назад';
      case 1:
        return ' день назад';
      case 2:
      case 3:
      case 4:
        return ' дня назад';
    }
    return ' дней назад';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseDivider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          minLeadingWidth: 0,
          leading: const Icon(Icons.liquor_rounded),
          title: Text(name),
          trailing: Text(
            count != null
                ? count.toString() + countWord
                : daysAgo.toString() + daysWord,
            style: Style.listAdditionalText,
          ),
        ),
        const BaseDivider(),
      ],
    );
  }
}
