import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../strings.dart';

const double _padding = 15;

class SearchField extends StatelessWidget {
  static const double height = 50 + _padding * 2;

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
      padding: const EdgeInsets.all(_padding),
      child: Ink(
        decoration: const BoxDecoration(
          color: AppTheme.white,
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
