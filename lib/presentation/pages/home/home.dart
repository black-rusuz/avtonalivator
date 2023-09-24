import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../fragments/cocktails/cocktails.dart';
import '../../fragments/settings/settings.dart';
import '../../fragments/stats/stats.dart';
import '../../fragments/tuning/tuning.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import 'pour_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late int index = 0;

  void setIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  static const bodies = [
    TuningFragment(),
    CocktailsFragment(),
    // StatsFragment(),
    SettingsFragment(),
  ];

  void startPour() {
    final provider = context.read<ConnectionProvider>();

    provider.startPour();
    showModalBottomSheet(
      context: context,
      builder: (_) => ChangeNotifierProvider.value(
        value: provider,
        child: const PourModal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// В TuningFragment свой Scaffold
      primary: index != 0,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => get<TuningProvider>()),
          ChangeNotifierProvider(create: (_) => get<CocktailsProvider>()),
          BlocProvider(create: (_) => get<SettingsCubit>()),
        ],
        child: bodies[index],
      ),
      floatingActionButton: index != 0
          ? null
          : FloatingActionButton.extended(
              onPressed: startPour,
              icon: const Icon(Icons.local_drink_rounded),
              label: const Text(Strings.pour),
            ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: setIndex,
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
          // NavigationDestination(
          //   icon: Icon(Icons.insert_chart_outlined_outlined),
          //   label: Strings.stats,
          // ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: Strings.settings,
          ),
        ],
      ),
    );
  }
}
