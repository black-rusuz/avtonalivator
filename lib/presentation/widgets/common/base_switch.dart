import '../../../style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class BaseSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool) onToggle;

  const BaseSwitch({
    super.key,
    required this.value,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      height: 25,
      width: 50,
      toggleSize: 21,
      borderRadius: 25,
      padding: 2,
      activeColor: Style.black.withOpacity(0.7),
      inactiveColor: Style.greyLight,
      value: value,
      onToggle: onToggle,
    );
  }
}
