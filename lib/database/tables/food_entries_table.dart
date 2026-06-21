import 'package:drift/drift.dart';

/// Drift table definition untuk entri makanan yang dicatat user.
///
/// Nama tabel di SQLite: food_entries (Drift konversi otomatis dari FoodEntries)
class FoodEntries extends Table {
  /// Primary key, auto-increment
  IntColumn get id => integer().autoIncrement()();

  /// Nama makanan, contoh: "Nasi Putih"
  TextColumn get name => text().withLength(min: 1, max: 255)();

  /// Emoji representasi makanan, contoh: "🍚"
  TextColumn get emoji => text().withLength(min: 1, max: 8)();

  /// Kalori per unit makanan (bukan total — total dihitung di domain layer)
  RealColumn get calories => real()();

  /// Protein (gram) per unit makanan
  RealColumn get protein => real()();

  /// Karbohidrat (gram) per unit makanan
  RealColumn get carbs => real()();

  /// Lemak (gram) per unit makanan
  RealColumn get fat => real()();

  /// Jumlah / porsi yang dikonsumsi
  RealColumn get qty => real()();

  /// Waktu makan disimpan sebagai nama enum:
  /// "breakfast" | "lunch" | "dinner" | "snack"
  TextColumn get mealType => text().withLength(min: 1, max: 20)();

  /// Waktu pencatatan makanan
  DateTimeColumn get loggedAt => dateTime()();
}
