import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../models/onboarding_item.dart';
import '../../../models/user_preferences.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/scene_composition.dart';
import '../../../widgets/screen_header.dart';

class ReadyScreen extends StatelessWidget {
  final UserPreferences preferences;
  final VoidCallback onBack;
  final VoidCallback onTrySevenDayStart;
  final VoidCallback onCreateChallenge;
  final VoidCallback onLookAround;

  const ReadyScreen({
    super.key,
    required this.preferences,
    required this.onBack,
    required this.onTrySevenDayStart,
    required this.onCreateChallenge,
    required this.onLookAround,
  });

  @override
  Widget build(BuildContext context) {
    // Custom OnboardingItem to feed the SceneComposition
    const readySceneItem = OnboardingItem(
      index: 7,
      screenId: 'ready',
      screenNumber: '08 / 08',
      titleBold: 'Your softer\nstart is',
      titleItalic: 'here.',
      subtitle: '',
      imageAsset: AppAssets.sproutCompanion,
      floatingNoteIcon: Icons.favorite_border_rounded,
      floatingNoteTitle: 'Your own kind of beginning.',
      floatingNoteSubtitle: 'A small first step.',
      primaryButtonLabel: 'Try a gentle seven-day start',
      secondaryButtonLabel: 'Create my own challenge',
      isPeachTone: false,
    );

    return Scaffold(
      backgroundColor: AppColors.creamCanvas,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            ScreenHeader(
              title: 'A fresh beginning',
              onBack: onBack,
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 6),

                    // Scene Composition with Sprout Companion & Hourglass
                    const SceneComposition(item: readySceneItem),

                    const SizedBox(height: 18),

                    // Eyebrow
                    Text(
                      'YOU’VE MADE ROOM',
                      style: AppTypography.eyebrow,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    // Two-line Hero Title with Italic Accent
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your softer\nstart is ',
                            style: AppTypography.heroTitleSans,
                          ),
                          TextSpan(
                            text: 'here.',
                            style: AppTypography.heroTitleItalic,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Subtitle personalized with user's intention
                    Text(
                      '${preferences.intention}. Let’s make your first small choice.',
                      style: AppTypography.subtitle,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    // Action 1: Primary Button with Leaf Icon
                    PrimaryButton(
                      label: 'Try a gentle seven-day start',
                      icon: Icons.eco_rounded,
                      showArrow: false,
                      onPressed: onTrySevenDayStart,
                    ),

                    const SizedBox(height: 8),

                    // Action 2: Secondary Ghost Button
                    GhostButton(
                      label: 'Create my own challenge',
                      onPressed: onCreateChallenge,
                    ),

                    // Action 3: Tertiary Ghost Button
                    GhostButton(
                      label: 'Let me look around',
                      onPressed: onLookAround,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
