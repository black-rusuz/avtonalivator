import 'package:flutter/material.dart';

class CocktailDescription extends StatelessWidget {
  final String text;

  const CocktailDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Text(text),
    );
  }
}
