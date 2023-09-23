import 'package:flutter/material.dart';

import 'core/router.dart';
import 'core/setup.dart';
import 'core/theme.dart';
import 'presentation/strings.dart';

void main() {
  setupApp().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.autoBartender,
      theme: AppTheme.value,
      initialRoute: AppRoutes.launch,
      onGenerateRoute: AppRoutes.openPage,
    );
  }
}
