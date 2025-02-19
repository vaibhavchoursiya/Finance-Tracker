import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            RegisterationForm()
          ],
        ),
      ),
    );
  }
}

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({
    super.key,
  });

  @override
  State<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationForm> {
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
                onPressed: () {},
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
