import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
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

  @override
  Widget build(BuildContext context) {
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
