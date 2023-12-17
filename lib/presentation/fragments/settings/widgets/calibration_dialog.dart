import 'package:flutter/material.dart';

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
        children: [
          Text(Strings.calibrateText),
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
