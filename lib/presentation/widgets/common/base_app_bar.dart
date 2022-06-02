import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  final String title;

  const BaseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 65,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(title, style: Style.pageTitle),
    );
  }
}
