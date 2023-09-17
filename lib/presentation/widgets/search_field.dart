import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../strings.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: AppTheme.white,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          labelText: Strings.enterName,
        ),
      ),
    );
  }
}
