import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String main = '/';
  static const String home = '/home';

  static final router = GoRouter(
    initialLocation: AppRoutes.main,
    routes: [
      GoRoute(
        path: AppRoutes.main,
        builder: (_, __) => const SizedBox(),
      ),
    ],
  );
}
