import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../strings.dart';
import 'text_field_label.dart';

const _padding = AppTheme.padding;

class SearchField extends StatelessWidget {
  static final height = 50 + _padding.vertical;

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
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          label: Label(Strings.enterName),
        ),
      ),
    );
  }
}
