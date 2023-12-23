import 'package:flutter/material.dart';

class SliverScaffold extends StatelessWidget {
  final Widget? sliverAppBar;
  final Widget? body;
  final ScrollableWidgetBuilder? bodyBuilder;

  const SliverScaffold({
    super.key,
    this.sliverAppBar,
    this.body,
    this.bodyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return CustomScrollView(
      controller: controller,
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
