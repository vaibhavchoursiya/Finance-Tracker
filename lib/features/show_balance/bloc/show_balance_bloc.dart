import 'package:finence_tracker/features/show_balance/bloc/show_balance_event.dart';
import 'package:finence_tracker/features/show_balance/bloc/show_balance_state.dart';
import 'package:finence_tracker/services/db_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBalanceBloc extends Bloc<ShowBalanceEvent, ShowBalanceState> {
  ShowBalanceBloc() : super(ShowBalanceLoadingState()) {
    on<ShowBalanceEvent>((event, emit) async {
      final res = await DbServices.getBalance();

      emit(ShowBalanceInitialState(
          expenses: res["expenses"],
          income: res["income"],
          totalBalance: res["totalBalance"]));
    });
  }
}
