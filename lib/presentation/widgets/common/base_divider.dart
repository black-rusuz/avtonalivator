import '../../../style.dart';
import 'package:flutter/material.dart';

class BaseDivider extends StatelessWidget {
  final double indent;

  const BaseDivider({super.key, this.indent = 20});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Style.greyDivider,
      height: 0.4,
      thickness: 0.4,
      indent: indent,
      endIndent: indent,
    );
  }
}
