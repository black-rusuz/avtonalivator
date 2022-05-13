import 'package:avtonalivator/presentation/connection/connection_page.dart';
import 'package:avtonalivator/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

import 'presentation/status/status_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: чё с темой, цветами, етс?
    return MaterialApp(
      title: 'Автобармен',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/test',
      onGenerateRoute: (RouteSettings settings) => routeByName(settings),
    );
  }

  pageWrapper(Widget page) => MaterialPageRoute(builder: (_) => page);

  MaterialPageRoute? routeByName(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return pageWrapper(const StatusPage());
      case '/connection':
        return pageWrapper(ConnectionPage());
      case '/home':
        return pageWrapper(const HomePage());

      case '/test':
        return pageWrapper(ConnectionPage());
      default:
        return pageWrapper(const SizedBox());
    }
  }
}
