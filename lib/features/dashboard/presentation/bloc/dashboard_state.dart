import 'package:equatable/equatable.dart';

import '../../domain/models/daily_summary.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

final class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

final class DashboardLoaded extends DashboardState {
  const DashboardLoaded({
    required this.summary,
    required this.selectedDate,
  });

  final DailySummary summary;
  final DateTime selectedDate;

  @override
  List<Object?> get props => [summary, selectedDate];
}

final class DashboardError extends DashboardState {
  const DashboardError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
