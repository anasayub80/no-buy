import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class AchievementPreviewCard extends StatelessWidget {
  final int unlockedCount;
  final int totalCount;
  final VoidCallback? onTap;

  const AchievementPreviewCard({
    super.key,
    this.unlockedCount = 0,
    this.totalCount = 7,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5DE),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xFFF0E3B9), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(19),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              children: [
                // Gold Achievement Medal
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFFF5BF), Color(0xFFE9C365)],
                    ),
                    border: Border.all(color: const Color(0xFFFFF2CE), width: 2.5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x20DFB663),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.eco_rounded,
                      size: 20,
                      color: Color(0xFF8C682D),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Text details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$unlockedCount / $totalCount ACHIEVEMENTS',
                        style: AppTypography.eyebrow.copyWith(
                          fontSize: 8.5,
                          color: const Color(0xFF9A793F),
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Your first little win awaits',
                        style: AppTypography.floatingNoteTitle.copyWith(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Let your first saved want go.',
                        style: AppTypography.floatingNoteSub.copyWith(
                          fontSize: 9.5,
                          color: const Color(0xFF88744E),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Chevron
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: Color(0xFF9A793F),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
