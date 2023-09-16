import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../fragments/cocktails.dart';
import '../../fragments/settings.dart';
import '../../fragments/stats.dart';
import '../../fragments/tuning.dart';
import '../../strings.dart';

class HomePage extends StatefulWidget {
  final int index;

  const HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index = widget.index;

  void showFragment(int index) {
    setState(() {
      this.index = index;
    });
  }

  String get title {
    switch (index) {
      case 0:
        return Strings.tuning;
      case 1:
        return Strings.cocktails;
      case 2:
        return Strings.stats;
      case 3:
        return Strings.settings;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title, style: AppTheme.pageTitle),
      ),
      body: const [
        TuningFragment(),
        CocktailsFragment(),
        StatsFragment(),
        SettingsFragment()
      ][index],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: showFragment,
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.tune_rounded),
            label: Strings.tuning,
          ),
          NavigationDestination(
            icon: Icon(Icons.liquor_rounded),
            label: Strings.cocktails,
          ),
          NavigationDestination(
            icon: Icon(Icons.insert_chart_outlined_outlined),
            label: Strings.stats,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: Strings.settings,
          ),
        ],
      ),
    );
  }
}
