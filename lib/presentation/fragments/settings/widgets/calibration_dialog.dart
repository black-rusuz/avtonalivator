import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme.dart';
import '../../../../domain/connection/device_methods.dart';
import '../../../strings.dart';
import '../../../widgets/text_field_label.dart';

class CalibrationDialog extends StatelessWidget {
  CalibrationDialog({super.key});

  final controller = TextEditingController();

  void calibrate(BuildContext context) {
    final connection = context.read<DeviceMethods>();

    final text = controller.text;
    final weight = int.tryParse(text);
    if (weight != null) connection.calibrate(weight);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.calibrateTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(Strings.calibrateText),
          const Text(Strings.calibrateSample, style: AppTheme.additional),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
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
          onPressed: () => calibrate(context),
          child: const Text(Strings.ok),
        ),
      ],
    );
  }
}
