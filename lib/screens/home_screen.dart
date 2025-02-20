import 'package:finence_tracker/features/show_balance/bloc/show_balance_bloc.dart';
import 'package:finence_tracker/features/show_balance/bloc/show_balance_event.dart';
import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_bloc.dart';
import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_event.dart';
import 'package:finence_tracker/features/show_transcation/bloc/show_transcation_state.dart';
import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/balance_card.dart';
import 'package:finence_tracker/widget/nav_bar.dart';
import 'package:finence_tracker/widget/transcation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialization();
    });
  }

  Future<void> initialization() async {
    final showTranscationBloc = context.read<ShowTranscationBloc>();
    final showBalanceBloc = context.read<ShowBalanceBloc>();
    showBalanceBloc.add(ShowBalanceEvent());
    showTranscationBloc.add(ShowTranscationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavBar(),
              const SizedBox(
                height: 35.0,
              ),
              const Stack(
                children: [
                  LightEffectLine(),
                  BalanceCard(),
                ],
              ),
              const SizedBox(
                height: 22.0,
              ),
              Text(
                "Transcations",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.light,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              BlocBuilder<ShowTranscationBloc, ShowTranscationState>(
                  builder: (context, state) {
                if (state is ShowTranscationLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is ShowTranscationSuccessState) {
                  return TranscationView(
                    transcations: state.transcatins,
                  );
                }
                return const CircularProgressIndicator(
                  color: Colors.greenAccent,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class LightEffectLine extends StatelessWidget {
  const LightEffectLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 100.0,
      right: 100.0,
      child: Container(
        width: 100.0,
        height: 4.0,
        decoration: BoxDecoration(
            color: AppTheme.light,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withOpacity(0.8), // Light color
                spreadRadius: 5, // How much it spreads
                blurRadius: 15, // Soft blur effect
                offset: const Offset(0, 0), // Centered glow
              ),
              // Subtle bottom shadow for depth
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1.2,
                blurRadius: 10,
                offset: const Offset(0, 2), // Positioned at bottom
              ),
            ]),
      ),
    );
  }
}
