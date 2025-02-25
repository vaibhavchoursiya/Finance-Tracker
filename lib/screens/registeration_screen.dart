import 'package:finence_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:finence_tracker/features/auth/bloc/auth_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/loading_widget.dart';
import 'package:finence_tracker/widget/registeration_form_widget.dart';
import 'package:finence_tracker/widget/scaffold_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary,
        onPressed: () {
          context.go("/login");
        },
        child: const Icon(
          Icons.arrow_forward_ios,
          color: AppTheme.light,
        ),
      ),
      backgroundColor: AppTheme.dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.22,
              ),
              const Icon(
                Icons.handshake,
                color: AppTheme.light,
                size: 64.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Register",
                style: GoogleFonts.aDLaMDisplay(
                  color: AppTheme.light,
                  fontSize: 32.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),

              // Agar UI builder karna hai state kee help sai then user builder jo ui build kargaa with help of state.
              // Agar koi side effect show karna hai jo ui ko build nahi karaga yai effect nahi karaga to listener user karn hai(navigation, snackbar,)
              BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                if (state is AuthSuccessState) {
                  scaffoldSnackBar(
                      context, Colors.greenAccent, "regiseration successful");
                  context.go("/login");
                }
                if (state is AuthFailedState) {
                  scaffoldSnackBar(
                      context, Colors.redAccent, state.errorMessage);
                }
              }, builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const LoadingWidget(
                    height: 300.0,
                    width: double.infinity,
                  );
                }

                if (state is AuthSuccessState) {
                  return const CircularProgressIndicator(
                    color: AppTheme.primary,
                  );
                }

                return const RegisterationFormWidget();
              })
            ],
          ),
        ),
      ),
    );
  }
}
