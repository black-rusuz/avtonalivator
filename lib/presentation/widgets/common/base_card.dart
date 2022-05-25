import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  const BaseCard({
    Key? key,
    required this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Style.yellowAccent,
        boxShadow: Style.cardShadow,
      ),
      child: child,
    );
  }
}
