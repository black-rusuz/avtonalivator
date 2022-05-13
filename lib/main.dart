import 'package:avtonalivator/presentation/connection/connection_page.dart';
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
        return pageWrapper(const SizedBox());
      case '/home':
        return pageWrapper(const SizedBox());

      case '/test':
        return pageWrapper(const ConnectionPage());
      default:
        return pageWrapper(const SizedBox());
    }
  }
}
