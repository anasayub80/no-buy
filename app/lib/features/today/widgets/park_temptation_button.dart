import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class ParkTemptationButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ParkTemptationButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 14),
      child: Material(
        color: AppColors.forest,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                // Plus badge in mint
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.mint,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_rounded,
                      color: AppColors.forest,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Text labels
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Park a temptation',
                        style: AppTypography.buttonPrimary.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Save a link · Wait 3 days or a week · Decide',
                        style: AppTypography.floatingNoteSub.copyWith(
                          fontSize: 9.5,
                          color: const Color(0xFFD4E4CD),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Right arrow
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
