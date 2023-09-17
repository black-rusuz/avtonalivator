import 'package:flutter/cupertino.dart';

import '../../../../core/theme.dart';
import '../../../widgets/basic_card.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasicCard(
      padding: AppTheme.padding,
      color: AppTheme.background,
      child: Text('Card'),
    );
  }
}
