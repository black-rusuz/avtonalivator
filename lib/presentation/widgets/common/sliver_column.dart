import 'package:flutter/material.dart';

class SliverColumn extends StatelessWidget {
  final List<Widget> children;

  const SliverColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}
