import 'package:flutter/material.dart';

import 'presentation/pages/launch_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автобармен',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LaunchPage(),
    );
  }
}
