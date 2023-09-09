import '../../../style.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String text;

  const PageHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(text, style: Style.pageTitle),
    );
  }
}
