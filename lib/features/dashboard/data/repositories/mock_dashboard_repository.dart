import 'package:nourish/features/dashboard/domain/models/daily_summary.dart';
import 'package:nourish/features/dashboard/domain/models/food_entry.dart';
import 'package:nourish/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class MockDashboardRepository implements DashboardRepository {
  final _entries = <int, FoodEntry>{
    1: FoodEntry(
      id: 1,
      name: 'Nasi Putih',
      emoji: '🍚',
      calories: 204,
      protein: 4.2,
      carbs: 44.5,
      fat: 0.4,
      qty: 1,
      mealType: MealType.breakfast,
      loggedAt: DateTime.now(),
    ),
    2: FoodEntry(
      id: 2,
      name: 'Telur Mata Sapi',
      emoji: '🍳',
      calories: 90,
      protein: 6.3,
      carbs: 0.4,
      fat: 6.8,
      qty: 2,
      mealType: MealType.breakfast,
      loggedAt: DateTime.now(),
    ),
    3: FoodEntry(
      id: 3,
      name: 'Ayam Bakar',
      emoji: '🍗',
      calories: 250,
      protein: 28.5,
      carbs: 2.1,
      fat: 13.5,
      qty: 1,
      mealType: MealType.lunch,
      loggedAt: DateTime.now(),
    ),
    4: FoodEntry(
      id: 4,
      name: 'Tempe Goreng',
      emoji: '🫘',
      calories: 190,
      protein: 11.0,
      carbs: 14.0,
      fat: 10.5,
      qty: 1,
      mealType: MealType.lunch,
      loggedAt: DateTime.now(),
    ),
    5: FoodEntry(
      id: 5,
      name: 'Pisang',
      emoji: '🍌',
      calories: 89,
      protein: 1.1,
      carbs: 23.0,
      fat: 0.3,
      qty: 1,
      mealType: MealType.snack,
      loggedAt: DateTime.now(),
    ),
  };

  @override
  Future<DailySummary> getDailySummary(DateTime date) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return DailySummary(
      date: date,
      entries: _entries.values.toList(),
      targetCalories: 2000,
    );
  }

  @override
  Future<void> deleteFoodEntry(int entryId) async {
    _entries.remove(entryId);
  }
}
