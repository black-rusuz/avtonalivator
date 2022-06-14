import 'package:flutter/material.dart';

import '../../../style.dart';

class CenterWrapper extends StatelessWidget {
  final Widget child;
  final bool colored;

  const CenterWrapper({
    Key? key,
    required this.child,
    this.colored = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colored ? Style.yellow : null,
      body: Center(child: child),
    );
  }
}
