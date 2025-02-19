import 'dart:ui';
import 'package:finence_tracker/features/login/bloc/login_bloc.dart';
import 'package:finence_tracker/features/login/bloc/login_event.dart';
import 'package:finence_tracker/screens/login_screen.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: AppTheme.light,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "welcome 👋",
                  style: GoogleFonts.aDLaMDisplay(
                    fontSize: 15.0,
                    height: 1.2,
                    color: AppTheme.light.withOpacity(0.8),
                  ),
                ),
                Text(
                  "Jone Doe",
                  style: GoogleFonts.roboto(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.light,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            loginBloc.add(LoginOutEvent());
            context.go("/login");
          },
          icon: const Icon(
            Icons.logout,
            color: AppTheme.light,
          ),
        )
      ],
    );
  }
}
