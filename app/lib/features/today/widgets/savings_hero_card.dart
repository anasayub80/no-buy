import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class SavingsHeroCard extends StatelessWidget {
  final double skippedAmount;
  final double monthSkippedAmount;
  final VoidCallback? onMonthTap;
  final VoidCallback? onAchievementsTap;

  const SavingsHeroCard({
    super.key,
    this.skippedAmount = 284.00,
    this.monthSkippedAmount = 0.00,
    this.onMonthTap,
    this.onAchievementsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.forest,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x16183F35),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Wireframe circular accent
          Positioned(
            right: -80,
            top: 20,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.mint.withValues(alpha: 0.12),
                  width: 1.2,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SAVINGS',
                      style: AppTypography.eyebrow.copyWith(
                        fontSize: 9,
                        color: AppColors.mint,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.mint.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.mint.withValues(alpha: 0.25),
                          width: 0.8,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.eco_rounded, size: 10, color: AppColors.mint),
                          const SizedBox(width: 4),
                          Text(
                            'From skipped purchases',
                            style: AppTypography.floatingNoteSub.copyWith(
                              fontSize: 8.5,
                              color: AppColors.mint,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Large Currency Amount
                Text(
                  '\$${skippedAmount.toStringAsFixed(2)}',
                  style: AppTypography.heroTitleSans.copyWith(
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.8,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),

                const SizedBox(height: 8),

                // Explanation Paragraph
                Text(
                  'Estimated spending you chose to avoid.',
                  style: AppTypography.subtitle.copyWith(
                    fontSize: 11,
                    color: const Color(0xFFD6E5CC),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Includes earlier prototype demo history.',
                  style: AppTypography.inputHint.copyWith(
                    fontSize: 9,
                    color: const Color(0xFFADC49E),
                  ),
                ),

                const SizedBox(height: 18),

                // Footer Row with Dividers
                Container(
                  padding: const EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.mint.withValues(alpha: 0.16),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: onMonthTap,
                        child: Row(
                          children: [
                            Text(
                              '\$${monthSkippedAmount.toStringAsFixed(2)} this month',
                              style: AppTypography.floatingNoteTitle.copyWith(
                                fontSize: 9.5,
                                color: AppColors.mint,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 11,
                              color: AppColors.mint,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: onAchievementsTap,
                        child: Row(
                          children: [
                            Text(
                              'My achievements',
                              style: AppTypography.floatingNoteTitle.copyWith(
                                fontSize: 9.5,
                                color: AppColors.mint,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '✧',
                              style: TextStyle(fontSize: 12, color: AppColors.mint),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
