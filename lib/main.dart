import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/router.dart';
import 'core/setup.dart';
import 'core/theme.dart';
import 'presentation/strings.dart';

const isDebug = kDebugMode;

void main() {
  if (isDebug) {
    setupApp().then((_) => runApp(const MyApp()));
  } else {
    runZonedGuarded(
      () => setupApp().then((_) => runApp(const MyApp())),
      (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
    );
  }
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
