import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'sprout_mascot.dart';

class KeepTheRhythmSection extends StatelessWidget {
  final VoidCallback? onMyProgress;
  final VoidCallback? onCheckIn;
  final VoidCallback? onBattle;
  final VoidCallback? onAntiHaul;
  final VoidCallback? onSetAside;

  const KeepTheRhythmSection({
    super.key,
    this.onMyProgress,
    this.onCheckIn,
    this.onBattle,
    this.onAntiHaul,
    this.onSetAside,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Keep the rhythm',
              style: AppTypography.heroTitleSans.copyWith(
                fontSize: 16.5,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
                color: AppColors.forest,
              ),
            ),
            InkWell(
              onTap: onMyProgress,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'My progress',
                  style: AppTypography.exploreLink.copyWith(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.forest,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Item 1: Daily check-in
        _buildListCard(
          icon: Icons.wb_sunny_outlined,
          iconBgColor: const Color(0xFFF7E2D6),
          iconColor: const Color(0xFF9D6F55),
          title: 'A tiny check-in. A little growth.',
          subtitle: 'Every thoughtful day counts.',
          onTap: onCheckIn,
        ),

        const SizedBox(height: 10),

        // Item 2: No-Buy Battles Teaser Card (with Sprout mascot!)
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF4EFE5),
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: const Color(0xFFE5E3D8), width: 1),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onBattle,
              borderRadius: BorderRadius.circular(21),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    // Mini Sprout Mascot
                    const SizedBox(
                      width: 68,
                      height: 65,
                      child: SproutMascot(width: 68, height: 65, animate: false),
                    ),
                    const SizedBox(width: 12),

                    // Texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NO-BUY BATTLES',
                            style: AppTypography.eyebrow.copyWith(
                              fontSize: 8.5,
                              color: const Color(0xFF7E8A79),
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'A little friendly\ncompetition.',
                            style: AppTypography.heroTitleSans.copyWith(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.forest,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Your rules. Private amounts.',
                            style: AppTypography.inputHint.copyWith(
                              fontSize: 9.5,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Arrow
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: AppColors.forest,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Item 3: This month's anti-haul
        _buildListCard(
          icon: Icons.file_upload_outlined,
          iconBgColor: const Color(0xFFEEF4E7),
          iconColor: const Color(0xFF5E7E49),
          title: 'This month’s anti-haul',
          subtitle: 'The wants you chose to let go.',
          onTap: onAntiHaul,
        ),

        const SizedBox(height: 10),

        // Item 4: Actually set aside
        _buildListCard(
          icon: Icons.account_balance_wallet_outlined,
          iconBgColor: const Color(0xFFEEF4E7),
          iconColor: const Color(0xFF5E7E49),
          title: 'Actually set aside',
          subtitle: '\$90.00 confirmed outside the app · includes existing demo data',
          onTap: onSetAside,
        ),
      ],
    );
  }

  Widget _buildListCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xFFE1E7DB), width: 1),
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
                // Icon badge
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 20,
                      color: iconColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.floatingNoteTitle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: AppTypography.floatingNoteSub.copyWith(
                          fontSize: 9.5,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Chevron
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 17,
                  color: Color(0xFF8B9B7E),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
