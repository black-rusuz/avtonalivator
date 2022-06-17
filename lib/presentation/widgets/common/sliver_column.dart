import 'package:flutter/material.dart';

class SliverColumn extends StatelessWidget {
  final List<Widget> children;

  const SliverColumn({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}
