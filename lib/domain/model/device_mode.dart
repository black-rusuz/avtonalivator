enum DeviceMode {
  wait(0),
  manual(1),
  auto(2),
  calibration(3);

  final int value;

  const DeviceMode(this.value);

  factory DeviceMode.fromNumber(int number) {
    return values.firstWhere(
      (mode) => mode.value == number,
      orElse: () => DeviceMode.wait,
    );
  }

  String get command => 'm$value';
}
