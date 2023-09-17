import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamePicker extends StatelessWidget {
  final ValueChanged<String> setName;
  final List<String> drinks;

  const NamePicker({
    super.key,
    required this.setName,
    required this.drinks,
  });

  Widget drinkMapper(String drink) {
    return Center(
      child: Text(drink),
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final keyboardVisible = query.viewInsets.bottom != 0;

    return Ink(
      height: keyboardVisible
          ? query.viewInsets.bottom + 80
          : query.size.height * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: setName,
              decoration: const InputDecoration(
                labelText: 'Введите название',
              ),
            ),
          ),
          if (!keyboardVisible)
            Expanded(
              child: CupertinoPicker(
                itemExtent: 32,
                onSelectedItemChanged: (i) => setName(drinks[i]),
                children: drinks.map(drinkMapper).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
