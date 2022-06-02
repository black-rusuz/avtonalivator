import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Style.greyDivider,
      height: 0.6,
      thickness: 0.6,
      indent: 20,
      endIndent: 20,
    );
  }
}
