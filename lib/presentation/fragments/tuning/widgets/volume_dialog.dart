import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../strings.dart';
import '../../../widgets/text_field_label.dart';

const _maxValue = 9999;

class VolumeDialog extends StatelessWidget {
  final double lastValue;
  final ValueChanged<double> setVolume;

  const VolumeDialog({
    super.key,
    required this.lastValue,
    required this.setVolume,
  });

  void apply(String data) {
    final value = double.tryParse(data) ?? 0;
    if (value <= _maxValue) setVolume(value);
  }

  void cancel(BuildContext context) {
    setVolume(lastValue);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(),
      child: AlertDialog(
        content: TextField(
          autofocus: true,
          onChanged: apply,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Label(Strings.enterVolume),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.deny(',', replacementString: '.'),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () => cancel(context),
            child: const Text(Strings.cancel),
          ),
          FilledButton(
            onPressed: Navigator.of(context).pop,
            child: const Text(Strings.ok),
          ),
        ],
      ),
    );
  }
}
