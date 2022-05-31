import 'package:flutter/material.dart';

class SliverWidgetList extends StatelessWidget {
  final List<Widget> children;

  const SliverWidgetList({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}
