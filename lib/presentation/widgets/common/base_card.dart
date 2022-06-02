import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isActive;
  final Widget child;
  final int duration;

  const BaseCard({
    Key? key,
    this.height,
    this.padding,
    this.margin,
    this.isActive = false,
    required this.child,
    this.duration = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 300,
      height: height,
      padding: padding,
      margin: margin,
      duration: Duration(milliseconds: duration),
      decoration: BoxDecoration(
        color: isActive ? Style.yellow : Style.yellowAccent,
        borderRadius: BorderRadius.circular(30),
        boxShadow: Style.cardShadows,
      ),
      child: child,
    );
  }
}
