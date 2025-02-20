import 'package:finence_tracker/features/add_transcation/bloc/add_transcation_bloc.dart';
import 'package:finence_tracker/features/add_transcation/bloc/add_transcation_event.dart';
import 'package:finence_tracker/features/add_transcation/bloc/transcation_state.dart';
import 'package:finence_tracker/features/show_balance/bloc/show_balance_bloc.dart';
import 'package:finence_tracker/features/show_balance/bloc/show_balance_event.dart';
import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_bloc.dart';
import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_event.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
import 'package:finence_tracker/widget/scaffold_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTranscationForm extends StatefulWidget {
  const AddTranscationForm({
    super.key,
  });

  @override
  State<AddTranscationForm> createState() => _AddTranscationFormState();
}

class _AddTranscationFormState extends State<AddTranscationForm> {
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
    final addTranscationBloc = context.read<AddTranscationBloc>();
    final showBalanceBloc = context.read<ShowBalanceBloc>();
    final showTranscationBloc = context.read<ShowTranscationBloc>();

    return BlocConsumer<AddTranscationBloc, TranscationState>(
        listener: (context, state) {
      if (state is TranscationFailedState) {
        scaffoldSnackBar(context, Colors.redAccent, state.errorMessage);
      } else if (state is TranscationSuccessState) {
        scaffoldSnackBar(context, Colors.redAccent, state.message);
        addTranscationBloc.add(ResetAddTranscationEvent());
        context.pop();
      }
    }, builder: (context, state) {
      if (state is TranscationLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is TranscationSuccessState) {
        return const CircularProgressIndicator();
      }
      return Form(
          key: addTranscationFormKey,
          child: Column(
            children: [
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
                hintText: DateTime.now().toString(),
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
                      addTranscationBloc.add(AddTranscationEvent(
                          note: _noteController.text,
                          category: _categoryController.text.toLowerCase(),
                          amount: double.parse(_amountController.text),
                          date: _dateController.text,
                          transcationalType: _dropdownValueController.text));
                      showTranscationBloc.add(ShowTranscationEvent());
                      showBalanceBloc.add(ShowBalanceEvent());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                  ),
                  child: Text(
                    "Transcation",
                    style: GoogleFonts.aDLaMDisplay(color: AppTheme.light),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
