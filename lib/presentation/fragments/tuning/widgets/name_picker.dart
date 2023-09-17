import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/search_field.dart';

const double _indent = 15;

class NamePicker extends StatefulWidget {
  final List<String> drinks;
  final ValueChanged<String> setDrink;

  const NamePicker({
    super.key,
    required this.drinks,
    required this.setDrink,
  });

  @override
  State<NamePicker> createState() => _NamePickerState();
}

class _NamePickerState extends State<NamePicker> {
  String inputValue = '';

  List<String> get drinks => widget.drinks.where(inputValue.searchIn).toList();

  void setValue(String value) {
    setState(() {
      inputValue = value;
    });
    setMatchDrink();
  }

  void setMatchDrink() {
    final drink = drinks.firstOrNull;
    widget.setDrink(drink ?? inputValue);
  }

  void setDrink(int index) {
    final drink = drinks[index];
    widget.setDrink(drink);
  }

  Widget drinkMapper(String drink) {
    return Center(
      child: Text(drink),
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Ink(
      height: drinks.isEmpty
          ? query.viewInsets.bottom + 50 + _indent * 2
          : query.size.height * 0.4 + query.viewInsets.bottom,
      child: Column(
        children: [
          BasicCard(
            height: 50 + _indent * 2,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(_indent),
            child: SearchField(onChanged: setValue),
          ),
          if (drinks.isNotEmpty)
            Expanded(
              child: CupertinoPicker(
                itemExtent: 32,
                onSelectedItemChanged: setDrink,
                children: drinks.map(drinkMapper).toList(),
              ),
            ),
          SizedBox(height: query.viewInsets.bottom),
        ],
      ),
    );
  }
}
