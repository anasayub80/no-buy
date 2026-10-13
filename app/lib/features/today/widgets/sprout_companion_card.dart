import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'sprout_mascot.dart';

class SproutCompanionCard extends StatelessWidget {
  final VoidCallback? onMeetMe;
  final VoidCallback? onHeartTap;

  const SproutCompanionCard({
    super.key,
    this.onMeetMe,
    this.onHeartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment(-0.1, -0.3),
          radius: 0.95,
          colors: [
            Color(0xFFFBFFDD),
            Color(0xFFE2EFC8),
            Color(0xFFD5E5BA),
          ],
          stops: [0.0, 0.65, 1.0],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE0E9CE), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A183F35),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Kicker Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('✧', style: TextStyle(fontSize: 12, color: Color(0xFF638348))),
                    const SizedBox(width: 4),
                    Text(
                      'YOUR LITTLE PAUSE PAL',
                      style: AppTypography.eyebrow.copyWith(
                        fontSize: 8.5,
                        color: const Color(0xFF4C6B37),
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onMeetMe,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Row(
                    children: [
                      Text(
                        'Meet me',
                        style: AppTypography.exploreLink.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 13,
                        color: AppColors.forest,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Center Scene with Orbit, Mascot, Tokens, and Sparkles
          SizedBox(
            height: 195,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Circular Orbit Line
                Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.6),
                      width: 1.2,
                    ),
                  ),
                ),

                // Star Left
                const Positioned(
                  top: 36,
                  left: 22,
                  child: Text(
                    '✳',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF638348),
                      height: 1,
                    ),
                  ),
                ),

                // Star Right
                const Positioned(
                  bottom: 30,
                  right: 22,
                  child: Text(
                    '✧',
                    style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF638348),
                      height: 1,
                    ),
                  ),
                ),

                // Central Mascot
                const SproutMascot(width: 175, height: 165),

                // Floating Token 1: Left (A want can wait)
                Positioned(
                  left: 2,
                  bottom: 24,
                  child: Transform.rotate(
                    angle: -7 * (math.pi / 180),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10365625),
                            blurRadius: 14,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.shopping_bag_outlined, size: 13, color: AppColors.forest),
                          const SizedBox(width: 5),
                          Text(
                            'A want can wait',
                            style: AppTypography.floatingNoteTitle.copyWith(
                              fontSize: 9.5,
                              color: AppColors.forest,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Floating Token 2: Right (3 days)
                Positioned(
                  right: 4,
                  top: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10365625),
                          blurRadius: 14,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.schedule_rounded, size: 13, color: AppColors.forest),
                        const SizedBox(width: 5),
                        Text(
                          '3 days',
                          style: AppTypography.floatingNoteTitle.copyWith(
                            fontSize: 9.5,
                            color: AppColors.forest,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // Bottom Info & Touch Button
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A FRESH START',
                    style: AppTypography.eyebrow.copyWith(
                      fontSize: 8.5,
                      color: const Color(0xFF638348),
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'A little pause.\n',
                          style: AppTypography.heroTitleSans.copyWith(
                            fontSize: 20,
                            height: 1.15,
                            letterSpacing: -0.6,
                          ),
                        ),
                        TextSpan(
                          text: 'A lighter mind.',
                          style: AppTypography.heroTitleItalic.copyWith(
                            fontSize: 22,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Heart Action Button
              InkWell(
                onTap: onHeartTap,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.75),
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0C183F35),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.favorite_border_rounded,
                      size: 19,
                      color: AppColors.forest,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
