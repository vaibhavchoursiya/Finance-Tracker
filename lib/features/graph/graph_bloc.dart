import 'package:finence_tracker/features/graph/graph_event.dart';
import 'package:finence_tracker/features/graph/graph_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  GraphBloc() : super(LoadingGraphState()) {
    on<LoadDataGraphEvent>(_loadDataGraphEvent);
    on<SwitchGraphExpensesEvent>(_switchGraphExpensesEvent);
    on<SwitchGraphIncomeEvent>(_switchGraphIncomeEvent);
  }

  void _loadDataGraphEvent(event, emit) {
    emit(LoadedGraphState(transactionType: "Inc"));
  }

  void _switchGraphExpensesEvent(event, emit) {
    emit(LoadedGraphState(transactionType: "Exp"));
  }

  void _switchGraphIncomeEvent(event, emit) {
    emit(LoadedGraphState(transactionType: "Inc"));
  }
}
