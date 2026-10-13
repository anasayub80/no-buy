import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class CounterTiles extends StatelessWidget {
  final double parkedAmount;
  final int parkedCount;
  final double monthSavingsAmount;
  final int monthSkipsCount;
  final VoidCallback? onParkedTap;
  final VoidCallback? onSavingsTap;

  const CounterTiles({
    super.key,
    this.parkedAmount = 173.00,
    this.parkedCount = 3,
    this.monthSavingsAmount = 0.00,
    this.monthSkipsCount = 0,
    this.onParkedTap,
    this.onSavingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          // Left Tile: Temptations parked (White Card)
          Expanded(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19),
              child: InkWell(
                onTap: onParkedTap,
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: const Color(0xFFE1E6D8), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temptations parked',
                        style: AppTypography.floatingNoteTitle.copyWith(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '\$${parkedAmount.toStringAsFixed(2)}',
                        style: AppTypography.heroTitleSans.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.8,
                          color: AppColors.forest,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '$parkedCount saved products · undecided',
                        style: AppTypography.inputHint.copyWith(
                          fontSize: 9.2,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Right Tile: Savings this month (Peach Tint Card)
          Expanded(
            child: Material(
              color: const Color(0xFFFFF1E7),
              borderRadius: BorderRadius.circular(19),
              child: InkWell(
                onTap: onSavingsTap,
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: const Color(0xFFF3E5D8), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Savings this month',
                        style: AppTypography.floatingNoteTitle.copyWith(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '\$${monthSavingsAmount.toStringAsFixed(2)}',
                        style: AppTypography.heroTitleSans.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.8,
                          color: AppColors.forest,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '$monthSkipsCount recorded skips · estimated savings',
                        style: AppTypography.inputHint.copyWith(
                          fontSize: 9.2,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
