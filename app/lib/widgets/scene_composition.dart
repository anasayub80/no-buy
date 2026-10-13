import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../models/onboarding_item.dart';

class SceneComposition extends StatefulWidget {
  final OnboardingItem item;

  const SceneComposition({super.key, required this.item});

  @override
  State<SceneComposition> createState() => _SceneCompositionState();
}

class _SceneCompositionState extends State<SceneComposition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _floatAnim;
  late Animation<double> _noteFloatAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: -4.0, end: 4.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeInOutSine,
      ),
    );

    _noteFloatAnim = Tween<double>(begin: 2.0, end: -3.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPeach = widget.item.isPeachTone;

    return SizedBox(
      height: 275,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // 1. Organic Halo Background
          Positioned.fill(
            child: Transform.rotate(
              angle: -7 * (math.pi / 180),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.1, -0.3),
                    radius: 0.85,
                    colors: isPeach
                        ? [
                            AppColors.peachHaloStart,
                            AppColors.peachLight,
                            AppColors.peachHaloEnd,
                          ]
                        : [
                            AppColors.mintHaloStart,
                            AppColors.mintLight,
                            AppColors.mintHaloEnd,
                          ],
                    stops: const [0.0, 0.65, 1.0],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(170, 150),
                    topRight: Radius.elliptical(180, 160),
                    bottomLeft: Radius.elliptical(160, 175),
                    bottomRight: Radius.elliptical(190, 170),
                  ),
                  border: Border.all(
                    color: isPeach
                        ? AppColors.haloPeachBorder
                        : AppColors.haloBorder,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),

          // 2. Decorative Sparks & Dots
          // Top Left Greenish Asterisk
          Positioned(
            top: 26,
            left: 20,
            child: Text(
              '✳',
              style: TextStyle(
                fontSize: 26,
                color: isPeach ? AppColors.sparkTwo : AppColors.sparkOne,
                height: 1,
              ),
            ),
          ),

          // Top Right Terracotta Star
          Positioned(
            top: 60,
            right: 18,
            child: Text(
              '✧',
              style: TextStyle(
                fontSize: 32,
                color: AppColors.sparkTwo,
                height: 1,
              ),
            ),
          ),

          // Small Peach Accent Dot
          Positioned(
            top: 22,
            right: 42,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.dotPeach,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // 3. Central 3D Illustration with gentle floating motion
          AnimatedBuilder(
            animation: _floatAnim,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatAnim.value),
                child: child,
              );
            },
            child: Container(
              height: 250,
              padding: const EdgeInsets.only(bottom: 12),
              child: Image.asset(
                widget.item.imageAsset,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),

          // 4. Floating Pill Note (Overlaid at bottom left)
          Positioned(
            bottom: 4,
            left: 12,
            right: 28,
            child: AnimatedBuilder(
              animation: _noteFloatAnim,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _noteFloatAnim.value),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cardBgTranslucent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.line,
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14183F35),
                        blurRadius: 24,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Pill Icon Container
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: isPeach
                              ? AppColors.peachLight
                              : const Color(0xFFEFF4E8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            widget.item.floatingNoteIcon,
                            size: 17,
                            color: isPeach
                                ? const Color(0xFF9E5C41)
                                : const Color(0xFF5E7E49),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Text info
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.item.floatingNoteTitle,
                              style: AppTypography.floatingNoteTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.item.floatingNoteSubtitle,
                              style: AppTypography.floatingNoteSub,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
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
