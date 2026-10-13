import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../models/user_preferences.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/screen_header.dart';

class RemindersScreen extends StatelessWidget {
  final UserPreferences preferences;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const RemindersScreen({
    super.key,
    required this.preferences,
    required this.onBack,
    required this.onNext,
  });

  void _handleEnableReminders() {
    preferences.remindersEnabled = true;
    onNext();
  }

  void _handleMaybeLater() {
    preferences.remindersEnabled = false;
    onNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamCanvas,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            ScreenHeader(
              title: 'Gentle reminders',
              onBack: onBack,
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 38),

                    // Concentric Peach Bell Icon Badge
                    Container(
                      width: 76,
                      height: 76,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF7E7DC),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF4DDD0),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: AppColors.forest,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Eyebrow
                    Text(
                      'ONLY A LITTLE NUDGE',
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
                            text: 'A reminder.\n',
                            style: AppTypography.heroTitleSans,
                          ),
                          TextSpan(
                            text: 'Never ',
                            style: AppTypography.heroTitleItalic,
                          ),
                          TextSpan(
                            text: 'a guilt trip.',
                            style: AppTypography.heroTitleSans,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Subtitle
                    Text(
                      'A daily check-in and a heads-up when a want has finished waiting. Choose what feels useful.',
                      style: AppTypography.subtitle,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 36),

                    // Primary Button: Choose my reminders
                    PrimaryButton(
                      label: 'Choose my reminders',
                      onPressed: _handleEnableReminders,
                    ),

                    const SizedBox(height: 8),

                    // Secondary Ghost Button: Maybe later
                    GhostButton(
                      label: 'Maybe later',
                      onPressed: _handleMaybeLater,
                    ),

                    const SizedBox(height: 24),

                    // Footer explanation text
                    Text(
                      'System notification permission would be requested\nafter you choose reminders in the real app.',
                      style: AppTypography.footerNote,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),
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
