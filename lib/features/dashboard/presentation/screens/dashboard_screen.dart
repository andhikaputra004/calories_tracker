import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nourish/core/constants/app_colors.dart';
import 'package:nourish/features/dashboard/domain/models/daily_summary.dart';
import 'package:nourish/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:nourish/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:nourish/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:nourish/features/dashboard/presentation/widgets/card_calories.dart';
import 'package:nourish/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:nourish/features/dashboard/presentation/widgets/eating_summary.dart';
import 'package:nourish/features/dashboard/presentation/widgets/water_tracker.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return switch (state) {
            DashboardInitial() => const _EmptyBody(),
            DashboardLoading() => const _LoadingBody(),
            DashboardLoaded() => _LoadedBody(summary: state.summary),
            DashboardError() => _ErrorBody(message: state.message),
          };
        },
      ),
    );
  }
}

// ── States ────────────────────────────────────────────────────────
class _LoadedBody extends StatelessWidget {
  const _LoadedBody({required this.summary});

  final DailySummary summary;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardHeader(),
            SizedBox(height: 16),
            CardCalories(),
            SizedBox(height: 16),
            EatingSummary(summary: summary, onSeeAll: () {}),
            SizedBox(height: 16),
            WaterTracker(current: 4, goal: 10),
          ],
        ),
      ),
    );
  }
}

class _EmptyBody extends StatelessWidget {
  const _EmptyBody();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Belum ada data'));
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.error,
            ),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () =>
                  context.read<DashboardBloc>().add(const DashboardStarted()),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}
