import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cocktails/cocktails_cubit.dart';

class CocktailSearch extends StatefulWidget {
  const CocktailSearch({Key? key}) : super(key: key);

  @override
  State<CocktailSearch> createState() => _CocktailSearchState();
}

class _CocktailSearchState extends State<CocktailSearch> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => EasyDebounce.debounce(
          '_',
          const Duration(milliseconds: 50),
          () => context.read<CocktailsCubit>().search(controller.text),
        ));
  }

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

  @override
  void dispose() {
    EasyDebounce.cancelAll();
    super.dispose();
  }
}
