import 'dart:math';

import 'package:finence_tracker/features/change_screen/bloc/change_screen_bloc.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_event.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final changeScreenBloc = context.read<ChangeScreenBloc>();

    return BlocBuilder<ChangeScreenBloc, ChangeScreenState>(
        builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppTheme.dark,
            AppTheme.accent,
          ], transform: GradientRotation(pi / 2)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: BottomNavigationBar(
            currentIndex: state.currentIndex,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int currentIndex) {
              changeScreenBloc.add(ChangeScreen(currentIndex: currentIndex));
            },
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  CupertinoIcons.home,
                  color: AppTheme.light,
                ),
              ),
              BottomNavigationBarItem(
                label: "Graph",
                icon: Icon(
                  CupertinoIcons.chart_bar,
                  color: AppTheme.light,
                ),
              ),
            ]),
      );
    });
  }
}
