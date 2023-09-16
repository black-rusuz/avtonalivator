import 'package:flutter/cupertino.dart';

import '../injection.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
}
