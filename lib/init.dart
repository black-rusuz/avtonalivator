import 'package:flutter/cupertino.dart';

import 'injection.dart';

class AppInitializer {
  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    initServices();
  }
}
