import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../strings.dart';

class VolumeDialog extends StatelessWidget {
  final double lastValue;
  final ValueChanged<double> setVolume;

  const VolumeDialog({
    super.key,
    required this.lastValue,
    required this.setVolume,
  });

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
          onChanged: (s) => setVolume(double.tryParse(s) ?? 0),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: Strings.enterVolume,
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
