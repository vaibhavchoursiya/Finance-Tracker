import 'package:finence_tracker/features/search/bloc/search_bloc.dart';
import 'package:finence_tracker/features/search/bloc/search_event.dart';
import 'package:finence_tracker/features/search/bloc/search_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/add_transaction_navbar.dart';
import 'package:finence_tracker/widget/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialization();
    });
  }

  Future<void> initialization() async {
    final searchBloc = context.read<SearchBloc>();
    searchBloc.add(SearchTransactionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              const ScreenNavBar(title: "Search"),
              const SizedBox(
                height: 16.0,
              ),
              SearchBar(
                onChanged: (query) {
                  final searchBloc = context.read<SearchBloc>();
                  searchBloc.add(SearchTransactionEvent(query: query));
                },
                backgroundColor: WidgetStatePropertyAll(
                  AppTheme.light.withOpacity(0.125),
                ),
                hintText: "Search your note here!",
                hintStyle: WidgetStatePropertyAll(
                  GoogleFonts.roboto(color: AppTheme.light.withOpacity(0.5)),
                ),
                textStyle: WidgetStatePropertyAll(
                  GoogleFonts.roboto(color: AppTheme.light),
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                if (state is LoadingSearchState) {
                  return const CircularProgressIndicator();
                } else if (state is LoadedSearchState) {
                  return TransactionView(transactions: state.transactions);
                }
                return const CircularProgressIndicator();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
