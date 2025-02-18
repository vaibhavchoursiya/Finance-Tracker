import 'package:finence_tracker/features/registration/bloc/registeraton_bloc.dart';
import 'package:finence_tracker/features/registration/bloc/registration_event.dart';
import 'package:finence_tracker/features/registration/bloc/registration_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MTextFormField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final Function validator;
  const MTextFormField({
    super.key,
    required this.iconData,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: GoogleFonts.aDLaMDisplay(
            color: AppTheme.light,
          ),
          validator: (value) {
            return validator(value);
          },
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  GoogleFonts.roboto(color: AppTheme.light.withOpacity(0.7)),
              filled: true,
              fillColor: AppTheme.light.withOpacity(0.125),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusColor: AppTheme.primary,
              prefixIcon: Icon(
                iconData,
                color: AppTheme.light,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class MTextFormFieldPassword extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;

  final Function validator;
  const MTextFormFieldPassword(
      {super.key,
      required this.iconData,
      required this.hintText,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final registerationBloc = context.read<RegisterationBloc>();
    return BlocBuilder<RegisterationBloc, RegistrationState>(
        builder: (context, state) {
      return Column(
        children: [
          TextFormField(
            controller: controller,
            validator: (value) {
              return validator(value);
            },
            style: GoogleFonts.aDLaMDisplay(
              color: AppTheme.light,
            ),
            obscureText: state.showPassword!,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    GoogleFonts.roboto(color: AppTheme.light.withOpacity(0.7)),
                filled: true,
                fillColor: AppTheme.light.withOpacity(0.125),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: AppTheme.primary,
                prefixIcon: Icon(
                  iconData,
                  color: AppTheme.light,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    registerationBloc.add(PasswordToggleEvent());
                  },
                  icon: state.showPassword!
                      ? const Icon(
                          Icons.lock,
                          color: AppTheme.primary,
                        )
                      : const Icon(
                          Icons.remove_red_eye,
                          color: AppTheme.light,
                        ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
    });
  }
}
