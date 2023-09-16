import 'package:go_router/go_router.dart';

import '../presentation/pages/home/home.dart';

class AppRoutes {
  static const String home = '/';

  static final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
