import 'package:finence_tracker/widget/transcation_tile.dart';
import 'package:flutter/material.dart';

class TranscationView extends StatelessWidget {
  const TranscationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TranscationTile(
            amount: 1234545.45,
            category: "Shopping",
            date: "Today",
          );
        });
  }
}
