import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/storage/settings.dart';
import '../data/storage/stats.dart';
import '../injection.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServices();
}

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(SettingsBox.name);
  await Hive.openBox(StatsBox.name);
}
