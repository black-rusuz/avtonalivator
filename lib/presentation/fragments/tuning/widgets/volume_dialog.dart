import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return AlertDialog(
      content: TextField(
        onChanged: (s) => setVolume(double.tryParse(s) ?? 0),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Введите объём',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(',', replacementString: '.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => cancel(context),
          child: const Text('Закрыть'),
        ),
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Ок'),
        ),
      ],
    );
  }
}
