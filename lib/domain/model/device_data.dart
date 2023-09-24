import 'package:equatable/equatable.dart';

import '../parse_utils.dart';

class DeviceData extends Equatable {
  final double weight;
  final double percent;
  final DeviceMode mode;
  final int step;
  final List<int> volumes;

  const DeviceData({
    required this.weight,
    required this.percent,
    required this.mode,
    required this.step,
    required this.volumes,
  });

  factory DeviceData.fromString(String data) {
    final parts = data.split('; ');

    final ves = parts.find('ves').value.asNumber;
    final per = parts.find('now_percent').value.asNumber;
    final mode = parts.find('mode').value.asNumber;
    final step = parts.find('step').value.asNumber;
    final ml = parts.find('ml').value.split(', ').map((e) => e.asNumber);

    return DeviceData(
      weight: ves.toDouble(),
      percent: per.toDouble(),
      mode: DeviceMode.fromNumber(mode.round()),
      step: step.round(),
      volumes: ml.map((e) => e.round()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        weight,
        percent,
        mode,
        step,
        volumes,
      ];
}

enum DeviceMode {
  wait(0),
  manual(1),
  auto(2);

  final int value;

  const DeviceMode(this.value);

  factory DeviceMode.fromNumber(int number) {
    return values.firstWhere(
      (mode) => mode.value == number,
      orElse: () => DeviceMode.wait,
    );
  }
}
