import 'package:flutter/material.dart';

import '../../core/theme.dart';

class BasicSliverBar extends StatelessWidget {
  final EdgeInsets padding;
  final Color? color;
  final double? maxHeight;
  final Widget? title;
  final Widget? trailing;
  final Widget child;

  const BasicSliverBar({
    super.key,
    this.padding = const EdgeInsets.only(top: 60),
    this.color,
    this.maxHeight,
    this.title,
    this.trailing,
    required this.child,
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
      actions: trailing == null ? null : [trailing!],
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
