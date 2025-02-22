import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:d_chart/d_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionChartWidget extends StatelessWidget {
  const TransactionChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
      if (state is LoadingGraphState) {
        return const CircularProgressIndicator();
      }
      if (state is LoadedGraphState) {
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: DChartLineT(
            configRenderLine: const ConfigRenderLine(
              strokeWidthPx: 2.5,
            ),
            layoutMargin: LayoutMargin(40, 10, 20, 10),
            domainAxis: DomainAxis(
              showLine: false,
              tickLength: 0,
              gapAxisToLabel: 10,
              tickLabelFormatterT: (domain) {
                return DateFormat('yy-MM-dd').format(domain);
              },
              labelStyle: const LabelStyle(
                color: AppTheme.light,
                fontSize: 10,
              ),
            ),
            measureAxis: MeasureAxis(
              useGridLine: true,
              gridLineStyle: LineStyle(
                color: AppTheme.primary.withOpacity(0.125),
              ),
              numericTickProvider: const NumericTickProvider(
                desiredMinTickCount: 6,
                desiredMaxTickCount: 10,
              ),
              tickLength: 0,
              gapAxisToLabel: 10,
              tickLabelFormatter: (measure) {
                return measure!.toInt().toString().padLeft(2, '0');
              },
              labelStyle: const LabelStyle(
                color: AppTheme.light,
                fontSize: 10,
              ),
            ),
            groupList: [
              TimeGroup(
                id: '1',
                data: state.series,
                color: Colors.deepPurple,
              ),
            ],
          ),
        );
      }
      return const CircularProgressIndicator();
    });
  }
}
