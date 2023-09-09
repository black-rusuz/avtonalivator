import '../../../style.dart';
import 'package:flutter/material.dart';

class AppBarActionsLoader extends StatelessWidget {
  const AppBarActionsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.all(12),
        child: const CircularProgressIndicator(
          color: Style.black,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
