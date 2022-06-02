import 'package:flutter/material.dart';

class CocktailDescription extends StatelessWidget {
  final String text;

  const CocktailDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(text),
      ),
    );
  }
}
