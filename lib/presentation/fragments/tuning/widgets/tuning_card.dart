import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../widgets/basic_card.dart';

class TuningCard extends StatelessWidget {
  const TuningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasicCard(
      padding: EdgeInsets.all(20),
      color: AppTheme.accent,
      child: Text('Card'),
    );
  }
}
