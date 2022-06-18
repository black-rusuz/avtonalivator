import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const BaseAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 65,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(title, style: Style.pageTitle),
      actions: Navigator.canPop(context)
          ? [
              IconButton(
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
              )
            ]
          : actions,
      leading: const SizedBox(),
    );
  }
}
