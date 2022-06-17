import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String text;

  const PageHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(text, style: Style.pageTitle),
    );
  }
}
