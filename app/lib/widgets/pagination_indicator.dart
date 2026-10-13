import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

class PaginationIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final ValueChanged<int>? onSelect;

  const PaginationIndicator({
    super.key,
    required this.currentIndex,
    this.totalCount = 4,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 10),
      child: Row(
        children: [
          // Dot & Pill Indicators
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(totalCount, (index) {
              final isActive = index == currentIndex;
              return GestureDetector(
                onTap: () => onSelect?.call(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    width: isActive ? 23 : 6,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.forest : AppColors.dotInactive,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              );
            }),
          ),

          const Spacer(),

          // Counter Text (e.g., 01 / 04)
          Text(
            '0${currentIndex + 1} / 0$totalCount',
            style: AppTypography.paginationCounter,
          ),
        ],
      ),
    );
  }
}
