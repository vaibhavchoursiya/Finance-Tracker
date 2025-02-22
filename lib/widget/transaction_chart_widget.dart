import 'package:flutter/material.dart';

import 'package:d_chart/d_chart.dart';
import 'package:intl/intl.dart';

class TransactionChartWidget extends StatelessWidget {
  const TransactionChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<TimeData> series1 = [
      TimeData(domain: DateTime(2024, 1), measure: 10),
      TimeData(domain: DateTime(2024, 2), measure: 20),
      TimeData(domain: DateTime(2024, 3), measure: 30),
      TimeData(domain: DateTime(2024, 4), measure: 50),
      TimeData(domain: DateTime(2024, 5), measure: 75),
      TimeData(domain: DateTime(2024, 6), measure: 55),
      TimeData(domain: DateTime(2024, 7), measure: 65),
      TimeData(domain: DateTime(2024, 8), measure: 58),
      TimeData(domain: DateTime(2024, 9), measure: 88),
      TimeData(domain: DateTime(2024, 9), measure: 50),
      TimeData(domain: DateTime(2024, 9), measure: 40),
      TimeData(domain: DateTime(2024, 9), measure: 4108),
    ];
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
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        measureAxis: MeasureAxis(
          useGridLine: false,
          gridLineStyle: LineStyle(
            color: Colors.grey.shade200,
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
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        groupList: [
          TimeGroup(
            id: '1',
            data: series1,
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
