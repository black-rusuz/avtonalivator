import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../strings.dart';
import '../../../widgets/text_field_label.dart';

class CalibrationDialog extends StatelessWidget {
  const CalibrationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.calibrateTitle),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(Strings.calibrateText),
          Text(Strings.calibrateSample, style: AppTheme.additional),
          TextField(
            decoration: InputDecoration(
              label: Label(Strings.weight),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text(Strings.cancel),
        ),
        FilledButton(
          onPressed: () {},
          child: const Text(Strings.ok),
        ),
      ],
    );
  }
}
