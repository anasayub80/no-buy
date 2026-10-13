import 'package:flutter/material.dart';
import '../../core/theme/app_typography.dart';
import '../../models/onboarding_item.dart';
import '../../widgets/pagination_indicator.dart';
import '../../widgets/scene_composition.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final ValueChanged<int>? onSelectPage;

  const OnboardingPage({
    super.key,
    required this.item,
    this.onSelectPage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),

                  // 3D Scene Art Composition
                  SceneComposition(item: item),

                  const SizedBox(height: 16),

                  // Two-line Hero Title with Italic Accent
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${item.titleBold}\n',
                          style: AppTypography.heroTitleSans,
                        ),
                        TextSpan(
                          text: item.titleItalic,
                          style: AppTypography.heroTitleItalic,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Clear, reassuring subtitle
                  Text(
                    item.subtitle,
                    style: AppTypography.subtitle,
                  ),

                  const Spacer(),

                  // 4-step pagination indicator & counter (e.g. 01 / 04)
                  PaginationIndicator(
                    currentIndex: item.index,
                    totalCount: OnboardingItem.items.length,
                    onSelect: onSelectPage,
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
