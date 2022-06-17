import 'package:avtonalivator/cubit/tuning/tuning_cubit.dart';
import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/connect/connect_cubit.dart';
import '../fragments/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void setIndex(int index) => setState(() => selectedIndex = index);

  final List<Widget> pages = [
    const TuningFragment(),
    const CocktailsFragment(),
    const StatsFragment(),
    const SettingsFragment(),
  ];

  BottomNavigationBar get navBar => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Style.yellowAccent,
        selectedItemColor: Style.black,
        unselectedItemColor: Style.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: setIndex,
        items: [
          navItem(const Icon(Icons.tune_rounded)),
          navItem(const Icon(Icons.liquor_rounded)),
          navItem(const Icon(Icons.insert_chart_outlined_outlined)),
          navItem(const Icon(Icons.settings_rounded)),
        ],
      );

  BottomNavigationBarItem navItem(Icon icon) => BottomNavigationBarItem(
        label: '',
        icon: icon,
        activeIcon: Container(
          child: icon,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Style.yellow,
            shape: BoxShape.circle,
          ),
        ),
      );

  FloatingActionButton? get button =>
      selectedIndex == 0 && context.read<ConnectCubit>().isConnected
          ? FloatingActionButton.extended(
              onPressed: sendPour,
              icon: const Icon(Icons.local_drink_rounded),
              label: const Text('Налить'),
            )
          : null;

  void sendPour() {
    context.read<TuningCubit>().saveStats();
    context.read<ConnectCubit>().sendPour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.yellowAccent,
      body: pages[selectedIndex],
      bottomNavigationBar: navBar,
      floatingActionButton: button,
    );
  }
}
