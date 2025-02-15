import 'dart:math';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.25),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
            transform: const GradientRotation(pi / 4),
          ),
          shape: BoxShape.circle,
        ),
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
