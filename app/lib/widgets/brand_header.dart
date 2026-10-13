import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class BrandHeader extends StatelessWidget {
  final VoidCallback? onExplore;

  const BrandHeader({super.key, this.onExplore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo & Name
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

          // Explore link
          TextButton(
            onPressed: onExplore,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              minimumSize: const Size(44, 40),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Explore',
              style: AppTypography.exploreLink,
            ),
          ),
        ],
      ),
    );
  }
}
