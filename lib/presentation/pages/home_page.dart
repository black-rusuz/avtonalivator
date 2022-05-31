import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

import 'home_fragments/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _setIndex(int index) => setState(() => _selectedIndex = index);

  final List<Widget> _pages = [
    const TuningFragment(),
    const CocktailsFragment(),
    const StatsFragment(),
    const SettingsFragment(),
  ];

  BottomNavigationBar get _navBar => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _setIndex,
        items: [
          _navItem(const Icon(Icons.tune_rounded)),
          _navItem(const Icon(Icons.local_drink_rounded)),
          _navItem(const Icon(Icons.insert_chart_outlined_outlined)),
          _navItem(const Icon(Icons.settings_rounded)),
        ],
      );

  BottomNavigationBarItem _navItem(Icon icon) => BottomNavigationBarItem(
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

  @override
  Widget build(BuildContext context) {
    // TODO: красивый домашний экран
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _navBar,
      backgroundColor: Colors.white,
    );
  }
}
