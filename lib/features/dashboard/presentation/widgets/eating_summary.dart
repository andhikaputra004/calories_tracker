import 'package:flutter/material.dart';
import 'package:nourish/core/constants/app_colors.dart';
import 'package:nourish/core/extensions/context_extensions.dart';
import 'package:nourish/features/dashboard/domain/models/daily_summary.dart';
import 'package:nourish/features/dashboard/domain/models/food_entry.dart';

class EatingSummary extends StatelessWidget {
  const EatingSummary({
    super.key,
    required this.summary,
    required this.onSeeAll,
  });

  final DailySummary summary;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    final meals = MealType.values
        .map((type) => (type: type, entries: summary.entriesByMeal(type)))
        .where((m) => m.entries.isNotEmpty)
        .take(3)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SummaryHeader(onSeeAll: onSeeAll),
        const SizedBox(height: 12),
        ...meals.map(
          (m) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _MealCard(
              mealType: m.type,
              itemCount: m.entries.length,
              totalCalories: m.entries.fold(
                0.0,
                (sum, e) => sum + e.totalCalories,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryHeader extends StatelessWidget {
  const _SummaryHeader({required this.onSeeAll});

  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Ringkasan Makan', style: context.textTheme.titleMedium),
        const Spacer(),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(
            'Lihat semua',
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({
    required this.mealType,
    required this.itemCount,
    required this.totalCalories,
  });

  final MealType mealType;
  final int itemCount;
  final double totalCalories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Icon emoji dalam kotak kecil
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(mealType.emoji, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),
          // Nama meal + jumlah item
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealType.label,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$itemCount item',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Total kalori
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                totalCalories.toInt().toString(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'kkal',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension _MealTypeX on MealType {
  String get label => switch (this) {
    MealType.breakfast => 'Sarapan',
    MealType.lunch => 'Makan Siang',
    MealType.dinner => 'Makan Malam',
    MealType.snack => 'Camilan',
  };

  String get emoji => switch (this) {
    MealType.breakfast => '🌅',
    MealType.lunch => '☀️',
    MealType.dinner => '🌙',
    MealType.snack => '🍎',
  };
}
