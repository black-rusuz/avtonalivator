import 'package:flutter/material.dart';

class SliverScaffold extends StatelessWidget {
  final Widget? sliverAppBar;
  final Widget? body;
  final ScrollableWidgetBuilder? bodyBuilder;

  SliverScaffold({
    super.key,
    this.sliverAppBar,
    this.body,
    this.bodyBuilder,
  });

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (sliverAppBar != null) sliverAppBar!,
        if (body != null)
          SliverToBoxAdapter(
            child: body!,
          ),
        if (bodyBuilder != null)
          SliverToBoxAdapter(
            child: bodyBuilder!(context, controller),
          ),
      ],
    );
  }
}
