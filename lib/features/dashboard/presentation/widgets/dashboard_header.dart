import 'package:flutter/material.dart';
import 'package:nourish/core/constants/app_colors.dart';
import 'package:nourish/core/extensions/context_extensions.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rabu, 7 Mei 2026', style: context.textTheme.bodySmall),
            Text('Halo, Rina 👋', style: context.textTheme.displayMedium),
          ],
        ),
        Expanded(
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.accent,
              child: Text('R', style: context.textTheme.displayMedium),
            ),
          ),
        ),
      ],
    );
  }
}
