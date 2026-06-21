import 'package:equatable/equatable.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

final class DashboardStarted extends DashboardEvent {
  const DashboardStarted();
}

final class DashboardDateChanged extends DashboardEvent {
  const DashboardDateChanged(this.date);

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

final class DashboardFoodDeleted extends DashboardEvent {
  const DashboardFoodDeleted(this.entryId);

  final int entryId;

  @override
  List<Object?> get props => [entryId];
}
