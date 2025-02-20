abstract class ShowBalanceState {}

class ShowBalanceInitialState extends ShowBalanceState {
  final double totalBalance;
  final double income;
  final double expenses;

  ShowBalanceInitialState(
      {required this.totalBalance,
      required this.income,
      required this.expenses});
}

class ShowBalanceLoadingState extends ShowBalanceState {}
