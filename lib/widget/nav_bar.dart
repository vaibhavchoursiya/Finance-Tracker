import 'package:finence_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:finence_tracker/features/auth/bloc/auth_event.dart';
import 'package:finence_tracker/features/login/bloc/login_bloc.dart';
import 'package:finence_tracker/features/login/bloc/login_event.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  final String userName;
  const NavBar({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    final authBloc = context.read<AuthBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (context.mounted) {
                  Scaffold.of(context).openDrawer();
                }
              },
              icon: const Icon(
                Icons.menu,
                color: AppTheme.light,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  userName,
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
            authBloc.add(ReInitializeRegisterEvent());
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
