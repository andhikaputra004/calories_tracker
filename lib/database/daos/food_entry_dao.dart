import 'package:drift/drift.dart';

import '../../features/dashboard/domain/models/food_entry.dart';
import '../tables/food_entries_table.dart';

// TODO: Ganti dengan import AppDatabase yang sebenarnya setelah database class dibuat.
// Contoh:
//   import '../app_database.dart';
//   part 'food_entry_dao.g.dart';
//
// Dan ubah annotation menjadi:
//   @DriftAccessor(tables: [FoodEntries])
//   class FoodEntryDao extends DatabaseAccessor<AppDatabase>
//       with _$FoodEntryDaoMixin {
//     FoodEntryDao(super.db);
//   }

/// DAO untuk operasi CRUD dan reactive queries pada tabel [FoodEntries].
///
/// NOTE: Annotation @DriftAccessor disiapkan di sini; database class masih
/// TODO — akan dilengkapi saat AppDatabase dibuat.
@DriftAccessor(tables: [FoodEntries])
class FoodEntryDao {
  // TODO: Jadikan extends DatabaseAccessor<AppDatabase> with _$FoodEntryDaoMixin
  //       setelah AppDatabase tersedia.

  /// Stream reaktif yang memantau semua entri pada [date] tertentu.
  ///
  /// Sorted by [loggedAt] ascending.
  /// Gunakan di BLoC dengan StreamSubscription atau stream().
  Stream<List<FoodEntry>> watchEntriesByDate(DateTime date) {
    // TODO: Implementasi setelah AppDatabase tersedia.
    // Contoh implementasi:
    //   final startOfDay = DateTime(date.year, date.month, date.day);
    //   final endOfDay = startOfDay.add(const Duration(days: 1));
    //   return (select(foodEntries)
    //         ..where((t) =>
    //             t.loggedAt.isBiggerOrEqualValue(startOfDay) &
    //             t.loggedAt.isSmallerThanValue(endOfDay))
    //         ..orderBy([(t) => OrderingTerm.asc(t.loggedAt)]))
    //       .watch();
    throw UnimplementedError(
      'watchEntriesByDate() belum diimplementasikan — '
      'tunggu AppDatabase selesai dibuat.',
    );
  }

  /// Menyisipkan satu entri baru ke database.
  ///
  /// Mengembalikan [int] berisi id baris yang baru dibuat.
  // ignore: avoid_dynamic_calls
  // TODO: Ganti FoodEntriesCompanion setelah `flutter pub run build_runner build`
  Future<int> insertEntry(dynamic entry) async {
    // TODO: Implementasi setelah AppDatabase tersedia.
    // Contoh implementasi:
    //   return into(foodEntries).insert(entry);
    throw UnimplementedError(
      'insertEntry() belum diimplementasikan — '
      'tunggu AppDatabase selesai dibuat.',
    );
  }

  /// Menghapus entri berdasarkan [id].
  Future<void> deleteEntry(int id) async {
    // TODO: Implementasi setelah AppDatabase tersedia.
    // Contoh implementasi:
    //   await (delete(foodEntries)..where((t) => t.id.equals(id))).go();
    throw UnimplementedError(
      'deleteEntry() belum diimplementasikan — '
      'tunggu AppDatabase selesai dibuat.',
    );
  }
}
