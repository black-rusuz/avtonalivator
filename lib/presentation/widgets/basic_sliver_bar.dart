import 'package:flutter/material.dart';

import '../../core/theme.dart';

class BasicSliverBar extends StatelessWidget {
  final Color? color;
  final double? maxHeight;
  final Widget? title;
  final Widget child;

  const BasicSliverBar({
    super.key,
    this.color,
    this.maxHeight,
    required this.child,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final height = maxHeight ?? MediaQuery.of(context).size.height * 0.4;

    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height,
      backgroundColor: color ?? AppTheme.white,
      title: title,
      flexibleSpace: child,
    );
  }
}
