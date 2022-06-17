import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isActive;
  final Widget child;
  final void Function()? onTap;

  const BaseCard({
    Key? key,
    this.padding,
    this.margin,
    this.isActive = false,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: padding,
      margin: margin,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isActive ? Style.yellow : Style.yellowAccent,
        borderRadius: BorderRadius.circular(30),
        boxShadow: Style.cardShadows,
      ),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
