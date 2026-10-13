import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class EditorialRitualCard extends StatelessWidget {
  final VoidCallback? onTap;

  const EditorialRitualCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFBF1E7),
            Color(0xFFF5E4D6),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEDCD0), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
            child: Row(
              children: [
                // Left Column: Texts and Arrow Button
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GOOD THINGS, ALREADY HERE',
                        style: AppTypography.eyebrow.copyWith(
                          fontSize: 8.5,
                          color: const Color(0xFF9E745D),
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Less checkout.\nMore little joys.',
                        style: AppTypography.heroTitleSans.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.6,
                          height: 1.15,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFD6C1B1), width: 1),
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: AppColors.forest,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Right: 3D Illustration (Tea, books, ceramic arch)
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    AppAssets.quietRitual,
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
