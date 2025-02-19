import 'package:finence_tracker/features/login/bloc/login_bloc.dart';
import 'package:finence_tracker/features/login/bloc/login_event.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  State<LoginFormWidget> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<LoginFormWidget> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void clearTextEditingControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Form(
        key: loginFormKey,
        child: Column(
          children: [
            MTextFormField(
              iconData: Icons.email,
              hintText: "email@example.com",
              controller: _emailController,
              validator: Validators.validateEmail,
            ),
            MTextFormFieldPassword(
              iconData: Icons.password,
              hintText: "xxxxxxx",
              controller: _passwordController,
              validator: Validators.validatePassword,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                ),
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    debugPrint("login");
                    loginBloc.add(LoginUserEvent(
                        email: _emailController.text,
                        password: _passwordController.text));
                  }
                },
                child: Text(
                  "login",
                  style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
                ),
              ),
            )
          ],
        ));
  }
}
