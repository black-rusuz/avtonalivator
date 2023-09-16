import 'package:flutter/material.dart';

import '../presentation/pages/connect/connect.dart';
import '../presentation/pages/home/home.dart';
import '../presentation/pages/start/start.dart';

class AppRoutes {
  static const start = '/start';
  static const connect = '/connect';
  static const home = '/home';

  static const tuning = '/home/tuning';
  static const cocktails = '/home/cocktails';
  static const stats = '/home/stats';
  static const settings = '/home/settings';

  static Route? openPage(RouteSettings settings) {
    final path = settings.name ?? home;
    final mainRoute = '/' + path.split('/')[1];

    switch (mainRoute) {
      case start:
        return _getRoute(const StartPage());
      case connect:
        return _getRoute(const ConnectPage());
      case home:
        return _getHomeRoute(path);
    }

    return null;
  }

  static Route _getRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static Route? _getHomeRoute(String path) {
    String subPath = path.replaceAll(home, '');
    if (subPath.isEmpty) subPath = tuning.replaceAll(home, '');

    final route = _homeSubRoutes.firstWhere((r) => r.contains(subPath));
    final index = _homeSubRoutes.indexOf(route);

    return _getRoute(HomePage(index: index));
  }

  static List<String> get _homeSubRoutes => [
        tuning,
        cocktails,
        stats,
        settings,
      ];
}
