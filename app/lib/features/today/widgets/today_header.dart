import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class TodayHeader extends StatelessWidget {
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  const TodayHeader({
    super.key,
    this.onNotificationsTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand & Top Navigation Actions
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Lessly Logo & Brand
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.forest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.eco_rounded,
                      color: AppColors.mint,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'lessly',
                  style: AppTypography.brandTitle,
                ),
              ],
            ),

            // Notification Bell + Avatar
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onNotificationsTap,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.line, width: 1.2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.notifications_none_rounded,
                        size: 19,
                        color: AppColors.forest,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: onProfileTap,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF3DCCE),
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6E4330),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 22),

        // Eyebrow and Date Chip
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOUR SHOPPING DETOX',
              style: AppTypography.eyebrow,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEDF1E4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFDFE7D8), width: 1),
              ),
              child: Text(
                'Oct 13',
                style: AppTypography.floatingNoteTitle.copyWith(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF536C45),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Two-line Hero Title with Italic Accent
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Want it?\n',
                style: AppTypography.heroTitleSans.copyWith(
                  fontSize: 36,
                  height: 1.1,
                ),
              ),
              TextSpan(
                text: 'Wait on it.',
                style: AppTypography.heroTitleItalic.copyWith(
                  fontSize: 38,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),
      ],
    );
  }
}
