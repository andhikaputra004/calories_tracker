import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/daily_summary.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

/// Abstract repository interface untuk Dashboard.
/// Implementasi konkret ada di layer data.
abstract class DashboardRepository {
  /// Mengambil [DailySummary] berdasarkan tanggal tertentu.
  Future<DailySummary> getDailySummary(DateTime date);

  /// Menghapus food entry berdasarkan [entryId].
  Future<void> deleteFoodEntry(int entryId);
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required DashboardRepository repository})
      : _repository = repository,
        super(const DashboardInitial()) {
    on<DashboardStarted>(_onStarted);
    on<DashboardDateChanged>(_onDateChanged);
    on<DashboardFoodDeleted>(_onFoodDeleted);
  }

  final DashboardRepository _repository;

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    try {
      final today = DateTime.now();
      final summary = await _repository.getDailySummary(today);
      emit(DashboardLoaded(summary: summary, selectedDate: today));
    } catch (e) {
      debugPrint('[DashboardBloc] _onStarted error: $e');
      emit(DashboardError(e.toString()));
    }
  }

  Future<void> _onDateChanged(
    DashboardDateChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    try {
      final summary = await _repository.getDailySummary(event.date);
      emit(DashboardLoaded(summary: summary, selectedDate: event.date));
    } catch (e) {
      debugPrint('[DashboardBloc] _onDateChanged error: $e');
      emit(DashboardError(e.toString()));
    }
  }

  Future<void> _onFoodDeleted(
    DashboardFoodDeleted event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;
    if (currentState is! DashboardLoaded) return;

    try {
      await _repository.deleteFoodEntry(event.entryId);
      // Reload summary untuk tanggal yang sama agar totalCalories tetap derived
      // dari DailySummary dan tidak disimpan secara terpisah.
      final updatedSummary =
          await _repository.getDailySummary(currentState.selectedDate);
      emit(
        DashboardLoaded(
          summary: updatedSummary,
          selectedDate: currentState.selectedDate,
        ),
      );
    } catch (e) {
      debugPrint('[DashboardBloc] _onFoodDeleted error: $e');
      emit(DashboardError(e.toString()));
    }
  }
}
