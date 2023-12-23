import 'package:flutter/material.dart';

import '../../core/theme.dart';

class Label extends StatelessWidget {
  final String label;

  const Label(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: const BoxDecoration(
        color: AppTheme.background,
        borderRadius: AppTheme.borderRadius,
      ),
      child: Text(label),
    );
  }
}
