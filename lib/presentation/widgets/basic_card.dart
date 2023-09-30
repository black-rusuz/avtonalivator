import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';

const _disableDebug = true;
final _debugBorder = Border.all(width: 2, color: Colors.redAccent);

const _cardShadow = [
  BoxShadow(
    blurRadius: 2,
    offset: Offset(0, 0.2),
    color: Color.fromRGBO(0, 0, 0, 0.02),
  ),
  BoxShadow(
    blurRadius: 7,
    offset: Offset(0, 0.5),
    color: Color.fromRGBO(0, 0, 0, 0.04),
  ),
  BoxShadow(
    blurRadius: 30,
    offset: Offset(0, 2),
    color: Color.fromRGBO(0, 0, 0, 0.06),
  ),
];

class BasicCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxBorder? border;
  final BorderRadius borderRadius;
  final Color? color;
  final BoxShadow? shadow;
  final Alignment? alignment;
  final VoidCallback? onTap;

  const BasicCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.border,
    this.borderRadius = AppTheme.borderRadius,
    this.color,
    this.shadow,
    this.alignment,
    this.onTap,
  });

  static List<BoxShadow> get defaultShadow => _cardShadow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: GestureDetector(
        onTap: onTap,
        // borderRadius: borderRadius,
        child: Container(
          width: width,
          height: height,
          // padding: padding,
          color: color,
          child: alignment == null
              ? child
              : Align(
                  alignment: alignment!,
                  child: child,
                ),
        ),
      ),
    );
  }
}
