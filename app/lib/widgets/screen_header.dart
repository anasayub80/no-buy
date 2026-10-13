import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final Widget? trailing;

  const ScreenHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Circular Back Button
          InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.line, width: 1.2),
                color: Colors.transparent,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 15,
                  color: AppColors.forest,
                ),
              ),
            ),
          ),

          // Title
          Text(
            title,
            style: AppTypography.exploreLink.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.forest,
            ),
          ),

          // Trailing widget or empty space to keep title centered
          trailing ?? const SizedBox(width: 36),
        ],
      ),
    );
  }
}
