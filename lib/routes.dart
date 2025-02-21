import 'package:finence_tracker/screens/add_transaction_screen.dart';
import 'package:finence_tracker/screens/login_screen.dart';
import 'package:finence_tracker/screens/main_screen.dart';
import 'package:finence_tracker/screens/registeration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      builder: (context, state) {
        return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final String? name = snapshot.data?.displayName;
                debugPrint(name);
                if (name != null) {
                  return const MainScreen();
                }
              }
              return const RegisterationScreen();
            });
      },
    ),
    GoRoute(
      path: "/login",
      name: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/add_transcation",
      name: "/add_transcation",
      builder: (context, state) => const AddTranscationScreen(),
    ),
  ]);
}
