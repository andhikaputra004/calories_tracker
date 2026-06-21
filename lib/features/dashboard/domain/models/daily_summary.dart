import 'food_entry.dart';

class DailySummary {
  final DateTime date;
  final List<FoodEntry> entries;
  final double targetCalories;

  const DailySummary({
    required this.date,
    required this.entries,
    this.targetCalories = 2000,
  });

  // ── Derived getters — TIDAK disimpan di database ──────────────────────────

  /// Total kalori dari semua entri pada hari ini
  double get totalCalories =>
      entries.fold(0.0, (sum, e) => sum + e.totalCalories);

  /// Total protein (gram) dari semua entri
  double get totalProtein =>
      entries.fold(0.0, (sum, e) => sum + e.protein * e.qty);

  /// Total karbohidrat (gram) dari semua entri
  double get totalCarbs =>
      entries.fold(0.0, (sum, e) => sum + e.carbs * e.qty);

  /// Total lemak (gram) dari semua entri
  double get totalFat =>
      entries.fold(0.0, (sum, e) => sum + e.fat * e.qty);

  // ── Helper per waktu makan ────────────────────────────────────────────────

  List<FoodEntry> entriesByMeal(MealType mealType) =>
      entries.where((e) => e.mealType == mealType).toList();

  // ── copyWith ──────────────────────────────────────────────────────────────

  DailySummary copyWith({
    DateTime? date,
    List<FoodEntry>? entries,
    double? targetCalories,
  }) {
    return DailySummary(
      date: date ?? this.date,
      entries: entries ?? this.entries,
      targetCalories: targetCalories ?? this.targetCalories,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailySummary &&
          runtimeType == other.runtimeType &&
          date == other.date;

  @override
  int get hashCode => date.hashCode;

  @override
  String toString() =>
      'DailySummary(date: $date, entries: ${entries.length}, '
      'totalCalories: $totalCalories, totalProtein: $totalProtein, '
      'totalCarbs: $totalCarbs, totalFat: $totalFat)';
}
