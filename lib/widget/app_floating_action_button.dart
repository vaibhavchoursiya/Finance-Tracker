import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.25),
      ),
      child: const Icon(
        CupertinoIcons.add,
        color: AppTheme.light,
      ),
    );
  }
}
