import 'package:finence_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_bloc.dart';
import 'package:finence_tracker/features/login/bloc/login_bloc.dart';
import 'package:finence_tracker/features/password_visibilty_toggle/bloc/password_visibilty_toggle_bloc.dart';
import 'package:finence_tracker/firebase_options.dart';
import 'package:finence_tracker/routes.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // DataBase Implementation
  await DbServices.constructDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangeScreenBloc(),
        ),
        BlocProvider(
          create: (context) => PasswordVisibiltyToggleBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
