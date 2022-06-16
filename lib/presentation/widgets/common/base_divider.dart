import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseDivider extends StatelessWidget {
  final double indent;

  const BaseDivider({Key? key, this.indent = 20}) : super(key: key);

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
