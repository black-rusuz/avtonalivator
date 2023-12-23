enum LightingMode {
  mode1(1),
  mode2(2),
  mode3(3),
  mode4(4),
  mode5(5),
  mode6(6),
  mode7(7),
  mode8(8),
  mode9(9);

  static const char = 'o';
  final int value;

  const LightingMode(this.value);

  factory LightingMode.fromNumber(int number) {
    return values.firstWhere(
      (mode) => mode.value == number,
      orElse: () => LightingMode.mode1,
    );
  }

  String get command => 'm$value';
}
