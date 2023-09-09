import '../../../style.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  final String title;
  final bool pinned;
  final List<Widget>? actions;

  const BaseAppBar({
    super.key,
    required this.title,
    this.pinned = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      backgroundColor: pinned ? const Color(0xFFF9F9F9) : Colors.transparent,
      shape: pinned
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
          : null,
      elevation: 0,
      collapsedHeight: pinned ? 60 : 65,
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
