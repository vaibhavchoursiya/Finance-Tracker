import 'package:finence_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:finence_tracker/features/auth/bloc/auth_event.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationFormWidget extends StatefulWidget {
  const RegisterationFormWidget({
    super.key,
  });

  @override
  State<RegisterationFormWidget> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationFormWidget> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void clearTextEditingControllers() {
    _emailController.clear();
    _nameController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Form(
        key: registerFormKey,
        child: Column(
          children: [
            MTextFormField(
              iconData: Icons.email,
              hintText: "email@example.com",
              controller: _emailController,
              validator: Validators.validateEmail,
            ),
            MTextFormField(
              iconData: Icons.person,
              hintText: "enter your name",
              controller: _nameController,
              validator: Validators.validateString,
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
                  if (registerFormKey.currentState!.validate()) {
                    debugPrint("register");
                    authBloc.add(RegisterEvent(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text));
                    clearTextEditingControllers();
                  }
                },
                child: Text(
                  "register",
                  style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
                ),
              ),
            )
          ],
        ));
  }
}
