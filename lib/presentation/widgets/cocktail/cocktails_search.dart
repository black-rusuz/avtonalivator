import 'package:flutter/material.dart';

class CocktailSearch extends StatelessWidget {
  final TextEditingController? controller;

  const CocktailSearch({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Поиск',
          suffixIcon: const Icon(
            Icons.search,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}
