import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/graph/graph_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final graphBloc = context.read<GraphBloc>();
    return BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
      if (state is LoadingGraphState) {
        return const LoadingWidget(
          height: 60.0,
          width: double.infinity,
        );
      }
      if (state is LoadedGraphState) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2030),
                    initialDate: state.startDate,
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    graphBloc.add(SelectDateEvent(
                        startDate: DateTime.parse(formattedDate),
                        endDate: state.endDate,
                        transactionType: state.transactionType));
                  }
                },
                child: Container(
                  height: 50.0,
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.light.withOpacity(0.125),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    DateFormat("yyyy-MM-dd").format(state.startDate),
                    style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.compare_arrows,
              color: AppTheme.light,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2030),
                    initialDate: state.endDate,
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    graphBloc.add(SelectDateEvent(
                        startDate: state.startDate,
                        endDate: DateTime.parse(formattedDate),
                        transactionType: state.transactionType));
                  }
                },
                child: Container(
                  height: 50.0,
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.light.withOpacity(0.125),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    DateFormat("yyyy-MM-dd").format(state.endDate),
                    style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return const LoadingWidget(
        height: 60.0,
        width: double.infinity,
      );
    });
  }
}
