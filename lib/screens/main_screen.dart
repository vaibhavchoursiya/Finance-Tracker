import 'package:finence_tracker/features/change_screen/bloc/change_screen_bloc.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_state.dart';
import 'package:finence_tracker/screens/home_screen.dart';
import 'package:finence_tracker/screens/transaction_screen.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/app_bottom_navigation_bar.dart';
import 'package:finence_tracker/widget/app_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  final String userName;
  const MainScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AppFloatingActionButton(),
      backgroundColor: AppTheme.dark,
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: BlocBuilder<ChangeScreenBloc, ChangeScreenState>(
          builder: (context, state) {
        if (state.currentIndex != 1) {
          return HomeScreen(
            userName: userName,
          );
        }
        return const TranscationScreen();
      }),
    );
  }
}
