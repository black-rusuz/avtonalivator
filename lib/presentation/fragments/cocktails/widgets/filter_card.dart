import 'package:flutter/cupertino.dart';

import '../../../../core/theme.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_switch.dart';

class FilterCard extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const FilterCard({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppTheme.duration,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        boxShadow: BasicCard.defaultShadow,
        color: isActive ? AppTheme.accent : AppTheme.background,
        borderRadius: BorderRadius.circular(100),
      ),
      child: BasicCard(
        onTap: () => onChanged(!isActive),
        padding: AppTheme.padding,
        child: Row(
          children: [
            const Expanded(
              child: Text(Strings.readyForPouring, style: AppTheme.text),
            ),
            const SizedBox(width: 8),
            BasicSwitch(
              value: isActive,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
