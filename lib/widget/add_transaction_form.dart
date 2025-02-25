import 'package:finence_tracker/features/transaction/bloc/transaction_bloc.dart';
import 'package:finence_tracker/features/transaction/bloc/transaction_event.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final GlobalKey<FormState> addTranscationFormKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dropdownValueController =
      TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: addTranscationFormKey,
        child: Column(children: [
          const SizedBox(
            height: 22.0,
          ),
          MTextFormField(
            iconData: Icons.money,
            hintText: "Enter you amount",
            controller: _amountController,
            validator: Validators.validateAmount,
          ),
          MTextFormField(
            iconData: Icons.note,
            hintText: "Enter note",
            controller: _noteController,
            validator: Validators.validateString,
          ),
          MTextFormField(
            iconData: Icons.category,
            hintText: "Enter category",
            controller: _categoryController,
            validator: Validators.validateString,
          ),
          MDateFormField(
            iconData: Icons.date_range,
            hintText: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            controller: _dateController,
            validator: Validators.validateString,
          ),
          MDropDownFormField(
            controller: _dropdownValueController,
            iconData: Icons.menu,
            validator: Validators.validateString,
          ),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                if (addTranscationFormKey.currentState!.validate()) {
                  final transactionBloc = context.read<TransactionBloc>();
                  transactionBloc.add(
                    AddTransactionEvent(
                      note: _noteController.text,
                      category: _categoryController.text,
                      transactionType: _dropdownValueController.text,
                      date: _dateController.text,
                      amount: double.parse(_amountController.text),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
              ),
              child: Text(
                "Transaction",
                style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
              ),
            ),
          )
        ]));
  }
}
