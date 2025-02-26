import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/graph/graph_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphScreenTabs extends StatelessWidget {
  const GraphScreenTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
      if (state is LoadingGraphState) {
        return const LoadingWidget(
          height: 60.0,
          width: double.infinity,
        );
      }

      if (state is LoadedGraphState) {
        return SizedBox(
          height: 60.0,
          child: Stack(
            children: [
              // Background Animated Sliding Indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: state.transactionType == "Inc"
                    ? 0
                    : MediaQuery.of(context).size.width * 0.5 - 28.0,
                right: state.transactionType == "Inc"
                    ? MediaQuery.of(context).size.width * 0.5 - 28.0
                    : 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5 - 15,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),

              // Button Row
              Row(
                children: [
                  // Income Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        final graphBloc = context.read<GraphBloc>();

                        graphBloc.add(SwitchGraphIncomeEvent());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                              color: AppTheme.primary.withOpacity(0.3)),
                        ),
                        child: Text(
                          "Income",
                          style: GoogleFonts.roboto(
                            color: AppTheme.light,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15.0),

                  // Expenses Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        final graphBloc = context.read<GraphBloc>();

                        graphBloc.add(SwitchGraphExpensesEvent());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                              color: AppTheme.primary.withOpacity(0.3)),
                        ),
                        child: Text(
                          "Expenses",
                          style: GoogleFonts.roboto(
                            color: AppTheme.light,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
      return const LoadingWidget(
        height: 60.0,
        width: double.infinity,
      );
    });
  }
}
