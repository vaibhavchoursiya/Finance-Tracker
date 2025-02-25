import 'package:finence_tracker/features/login/bloc/login_bloc.dart';
import 'package:finence_tracker/features/login/bloc/login_state.dart';
import 'package:finence_tracker/services/firebase_services.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/loading_widget.dart';
import 'package:finence_tracker/widget/login_form_widget.dart';
import 'package:finence_tracker/widget/scaffold_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary,
        onPressed: () {
          context.go("/register");
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
                Icons.lock,
                color: AppTheme.light,
                size: 64.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Login",
                style: GoogleFonts.aDLaMDisplay(
                  color: AppTheme.light,
                  fontSize: 32.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),

              // Agar UI builder karna hai state kee help sai then use builder jo ui build kargaa with help of state.
              // Agar koi side effect show karna hai jo ui ko build nahi karaga yai effect nahi karaga to listener user karn hai(navigation, snackbar,)
              BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
                if (state is LoginLoadingState) {
                  return const LoadingWidget(
                    height: 300.0,
                    width: double.infinity,
                  );
                }

                if (state is LoginSuccessState) {
                  return const LoadingWidget(
                    height: 300.0,
                    width: double.infinity,
                  );
                }
                return const LoginFormWidget();
              }, listener: (context, state) {
                if (state is LoginFailedState) {
                  scaffoldSnackBar(
                      context, Colors.redAccent, state.errorMessage);
                }
                if (state is LoginSuccessState) {
                  scaffoldSnackBar(
                      context, Colors.greenAccent, "login successful");
                  final userName =
                      FirebaseServices.firebaseAuth.currentUser!.displayName;
                  // go to home screen
                  context.go("/home", extra: {"userName": userName});
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
