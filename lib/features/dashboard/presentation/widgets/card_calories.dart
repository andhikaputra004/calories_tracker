import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nourish/core/constants/app_colors.dart';
import 'package:nourish/core/extensions/context_extensions.dart';

class CardCalories extends StatelessWidget {
  const CardCalories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            _CalorieTopSection(consumed: 880, remaining: 2000),
            SizedBox(height: 24),
            _RemainingBanner(
              remainingCalories: 1140,
              targetCalories: 2000,
              addCalories: () {},
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _MacroItem(
                    label: 'PROTEIN',
                    current: 45,
                    goal: 120,
                    color: AppColors.proteinColor,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MacroItem(
                    label: 'KARBO',
                    current: 115,
                    goal: 250,
                    color: AppColors.carbsColor,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MacroItem(
                    label: 'LEMAK',
                    current: 41,
                    goal: 65,
                    color: AppColors.fatColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MacroItem extends StatefulWidget {
  const _MacroItem({
    required this.label,
    required this.current,
    required this.goal,
    required this.color,
  });

  final String label;
  final double current;
  final double goal;
  final Color color;

  @override
  State<_MacroItem> createState() => _MacroItemState();
}

class _MacroItemState extends State<_MacroItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    final targetProgress = (widget.current / widget.goal).clamp(0.0, 1.0);
    _animation = Tween<double>(
      begin: 0.0,
      end: targetProgress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.label,
                style: context.textTheme.labelSmall?.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${widget.current.toInt()}g',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: _animation.value,
                minHeight: 5,
                color: widget.color,
                backgroundColor: AppColors.ringTrack,
              ),
            );
          },
        ),
        const SizedBox(height: 6),
        Text(
          'Goal ${widget.goal.toInt()}g',
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _RemainingBanner extends StatelessWidget {
  const _RemainingBanner({
    required this.remainingCalories,
    required this.targetCalories,
    required this.addCalories,
  });

  final double remainingCalories;
  final double targetCalories;
  final VoidCallback addCalories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addCalories,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gin,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$remainingCalories kkal tersisa',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Target: $targetCalories',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarlorieRing extends StatelessWidget {
  const _CarlorieRing({
    Key? key,
    required this.remaining,
    required this.consume,
  }) : super(key: key);

  final double remaining;
  final double consume;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: consume,
              color: AppColors.accent,
              showTitle: false,
              radius: 12,
            ),
            PieChartSectionData(
              value: remaining,
              color: AppColors.ringTrack,
              showTitle: false,
              radius: 12,
            ),
          ],
          centerSpaceRadius: 30,
          sectionsSpace: 0,
        ),
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 900),
      ),
    );
  }
}

class _CalorieTopSection extends StatelessWidget {
  const _CalorieTopSection({required this.consumed, required this.remaining});

  final double consumed;
  final double remaining;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kalori Hari ini', style: context.textTheme.bodySmall),
              Text('$consumed', style: context.textTheme.displayLarge),
              Text('Dari $remaining kkal', style: context.textTheme.bodySmall),
            ],
          ),
        ),
        _CarlorieRing(remaining: remaining, consume: consumed),
      ],
    );
  }
}
