import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/add_transcation_form.dart';
import 'package:finence_tracker/widget/add_transcation_navbar.dart';
import 'package:flutter/material.dart';

class AddTranscationScreen extends StatelessWidget {
  const AddTranscationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              AddTranscationNavbar(),
              AddTranscationForm(),
            ],
          ),
        ),
      ),
    );
  }
}
