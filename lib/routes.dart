import 'package:finence_tracker/screens/main_screen.dart';
import 'package:finence_tracker/screens/registeration_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(initialLocation: "/register", routes: [
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: "/register",
      name: "/register",
      builder: (context, state) => const RegisterationScreen(),
    ),
  ]);
}
