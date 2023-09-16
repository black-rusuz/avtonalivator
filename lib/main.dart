import 'package:flutter/material.dart';

import 'core/setup.dart';
import 'core/router.dart';
import 'core/theme.dart';

void main() {
  setupApp().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.value,
      routerConfig: AppRoutes.router,
    );
  }
}
