import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../domain/model/device.dart';
import '../domain/storage/commands.dart';
import '../domain/storage/settings.dart';
import '../domain/storage/stats.dart';
import '../firebase_options.dart';
import '../injection.dart';
import '../main.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServices();

  await _initFirebase();
}

Future<void> initHive() async {
  Hive.registerAdapter(UiDeviceAdapter());
  await Hive.initFlutter();
  await Hive.openBox(SettingsBox.name);
  await Hive.openBox(StatsBox.name);
  await Hive.openBox(CommandsBox.name);
}

Future<void> _initFirebase() async {
  try {
    final options = DefaultFirebaseOptions.currentPlatform;
    await Firebase.initializeApp(options: options);

    final crashlytics = FirebaseCrashlytics.instance;
    await crashlytics.setCrashlyticsCollectionEnabled(!isDebug);
    FlutterError.onError = crashlytics.recordFlutterError;
  } catch (e) {
    // Log().writer.log('Firebase Error', e.toString());
    print(e);
  }
}
