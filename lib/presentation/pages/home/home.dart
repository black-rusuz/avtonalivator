import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../connection/connection_provider.dart';
import '../../fragments/cocktails/cocktails.dart';
import '../../fragments/settings/settings.dart';
import '../../fragments/stats/stats.dart';
import '../../fragments/tuning/tuning.dart';
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

  static const bodies = [
    TuningFragment(),
    CocktailsFragment(),
    StatsFragment(),
    SettingsFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// В TuningFragment свой Scaffold
      primary: index != 0,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => get<ConnectionProvider>()),
          BlocProvider(create: (_) => get<TuningBloc>()),
          ChangeNotifierProvider(create: (_) => get<CocktailsProvider>()),
          BlocProvider(create: (_) => get<SettingsCubit>()),
        ],
        child: bodies[index],
      ),
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
