import 'package:finence_tracker/features/graph/graph_bloc.dart';
import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/graph/graph_state.dart';
import 'package:finence_tracker/widget/graph_screen_navbar.dart';
import 'package:finence_tracker/widget/graph_screen_tabs.dart';
import 'package:finence_tracker/widget/loading_widget.dart';
import 'package:finence_tracker/widget/select_date_widget.dart';
import 'package:finence_tracker/widget/transaction_chart_widget.dart';
import 'package:finence_tracker/widget/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialization();
    });
  }

  Future<void> initialization() async {
    final graphBloc = context.read<GraphBloc>();
    graphBloc.add(LoadDataGraphEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(28.0),
        child: Column(
          children: [
            SizedBox(
              height: 14.0,
            ),
            GraphScreenNavBar(),
            SizedBox(
              height: 28.0,
            ),
            GraphScreenTabs(),
            SizedBox(
              height: 14.0,
            ),
            SelectDateWidget(),
            SizedBox(
              height: 28.0,
            ),
            TransactionChartWidget(),
            GraphTransactionView(),
          ],
        ),
      ),
    );
  }
}

class GraphTransactionView extends StatelessWidget {
  const GraphTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
      if (state is LoadingGraphState) {
        return const LoadingWidget(
          height: 250.0,
          width: double.infinity,
        );
      }
      if (state is LoadedGraphState) {
        return TransactionView(transactions: state.transcations);
      }
      return const LoadingWidget(
        height: 250.0,
        width: double.infinity,
      );
    });
  }
}
