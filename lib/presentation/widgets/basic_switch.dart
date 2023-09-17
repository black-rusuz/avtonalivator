import 'package:flutter/cupertino.dart';

import '../../core/theme.dart';

class BasicSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BasicSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: AppTheme.black.withOpacity(0.7),
      trackColor: AppTheme.greyLight,
      value: value,
      onChanged: onChanged,
    );
  }
}
