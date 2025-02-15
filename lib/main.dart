import 'package:finence_tracker/features/change_screen/bloc/change_screen_bloc.dart';
import 'package:finence_tracker/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            surface: Color(0xFFf3f5f7),
            onSurface: Color(0xFF344557),
            primary: Color(0xFF67bde7),
            secondary: Color(0xFFd46ce4),
            tertiary: Color(0xFFf68f80),
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
