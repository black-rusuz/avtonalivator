import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../strings.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.accent,
      body: ListView(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(Strings.skipNow),
        icon: const Icon(Icons.skip_next_rounded),
        // onPressed: () => context.read<ScanCubit>().skip(),
        onPressed: () {},
      ),
    );
  }
}
