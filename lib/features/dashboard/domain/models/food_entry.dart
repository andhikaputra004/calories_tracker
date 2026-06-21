enum MealType { breakfast, lunch, dinner, snack }

class FoodEntry {
  final int id;
  final String name;
  final String emoji;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final double qty;
  final MealType mealType;
  final DateTime loggedAt;

  const FoodEntry({
    required this.id,
    required this.name,
    required this.emoji,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.qty,
    required this.mealType,
    required this.loggedAt,
  });

  /// Kalori total = kalori per unit × jumlah (qty)
  double get totalCalories => calories * qty;

  FoodEntry copyWith({
    int? id,
    String? name,
    String? emoji,
    double? calories,
    double? protein,
    double? carbs,
    double? fat,
    double? qty,
    MealType? mealType,
    DateTime? loggedAt,
  }) {
    return FoodEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      qty: qty ?? this.qty,
      mealType: mealType ?? this.mealType,
      loggedAt: loggedAt ?? this.loggedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEntry &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'FoodEntry(id: $id, name: $name, mealType: $mealType, qty: $qty, '
      'calories: $calories, totalCalories: $totalCalories, loggedAt: $loggedAt)';
}
