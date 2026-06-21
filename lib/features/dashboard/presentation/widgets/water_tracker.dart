import 'package:flutter/material.dart';
import 'package:nourish/core/constants/app_colors.dart';
import 'package:nourish/core/extensions/context_extensions.dart';

class WaterTracker extends StatelessWidget {
  const WaterTracker({
    super.key,
    required this.current,
    required this.goal,
  });

  final int current;
  final int goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.waterColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.water_drop, color: AppColors.waterColor, size: 18),
              const SizedBox(width: 8),
              Text('Air Minum', style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              )),
              const Spacer(),
              Text(
                '$current/$goal gelas',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.waterColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              goal,
              (i) => _GlassBox(filled: i < current),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassBox extends StatelessWidget {
  const _GlassBox({required this.filled});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: filled
            ? AppColors.waterColor
            : AppColors.waterColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
