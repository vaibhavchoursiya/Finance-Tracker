import 'package:finence_tracker/features/change_screen/bloc/change_screen_bloc.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_event.dart';
import 'package:finence_tracker/features/change_screen/bloc/change_screen_state.dart';
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
      return BottomNavigationBar(
          currentIndex: state.currentIndex,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int currentIndex) {
            changeScreenBloc.add(ChangeScreen(currentIndex: currentIndex));
          },
          elevation: 0,
          fixedColor: Theme.of(context).colorScheme.onSurface,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                CupertinoIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Graph",
              icon: Icon(
                CupertinoIcons.chart_bar,
              ),
            ),
          ]);
    });
  }
}
