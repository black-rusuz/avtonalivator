import 'package:flutter/cupertino.dart';

import '../strings.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Strings.settings),
    );
  }
}
