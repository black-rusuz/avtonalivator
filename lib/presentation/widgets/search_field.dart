import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../strings.dart';

const _padding = AppTheme.padding;

class SearchField extends StatelessWidget {
  static final double height = 50 + _padding.vertical;

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.padding,
      child: Ink(
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: AppTheme.borderRadius,
        ),
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: Strings.enterName,
          ),
        ),
      ),
    );
  }
}
