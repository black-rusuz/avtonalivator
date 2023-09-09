import 'package:flutter/material.dart';

import '../../../style.dart';
import '../common/base_card.dart';

class StatsAchievements extends StatelessWidget {
  const StatsAchievements({super.key});

  void showAchievements(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        builder: (context) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.75,
          builder: (context, controller) => const Center(
            child: Text('Тут пока ничего нет...'),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 18),
      margin: const EdgeInsets.all(20),
      onTap: () => showAchievements(context),
      isActive: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.emoji_events_rounded),
          ),
          Text(
            'Достижения',
            textAlign: TextAlign.center,
            style: Style.text.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
