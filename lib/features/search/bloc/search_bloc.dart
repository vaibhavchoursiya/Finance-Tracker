import 'package:finence_tracker/features/search/bloc/search_event.dart';
import 'package:finence_tracker/features/search/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(LoadingSearchState()) {
    on<SearchTransactionEvent>(_searchTransactionEvent);
  }

  _searchTransactionEvent(event, emit) async {
    emit(LoadingSearchState());
  }
}
