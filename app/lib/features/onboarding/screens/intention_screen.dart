import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../models/user_preferences.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/screen_header.dart';

class IntentionOption {
  final String title;
  final String subtitle;
  final IconData icon;

  const IntentionOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class IntentionScreen extends StatefulWidget {
  final UserPreferences preferences;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const IntentionScreen({
    super.key,
    required this.preferences,
    required this.onBack,
    required this.onNext,
  });

  @override
  State<IntentionScreen> createState() => _IntentionScreenState();
}

class _IntentionScreenState extends State<IntentionScreen> {
  static const List<IntentionOption> _options = [
    IntentionOption(
      title: 'Spend with intention',
      subtitle: 'Buy fewer things I don’t really want.',
      icon: Icons.favorite_border_rounded,
    ),
    IntentionOption(
      title: 'Build a little freedom',
      subtitle: 'Make room for a meaningful goal.',
      icon: Icons.near_me_outlined,
    ),
    IntentionOption(
      title: 'Enjoy what I own',
      subtitle: 'Use, repair and rediscover.',
      icon: Icons.door_sliding_outlined,
    ),
    IntentionOption(
      title: 'Feel less overwhelmed',
      subtitle: 'Create a calmer daily rhythm.',
      icon: Icons.eco_outlined,
    ),
  ];

  late String _selectedIntention;

  @override
  void initState() {
    super.initState();
    _selectedIntention = widget.preferences.intention;
  }

  void _handleSelect(String title) {
    setState(() {
      _selectedIntention = title;
      widget.preferences.intention = title;
    });
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
              title: 'Your intention',
              onBack: widget.onBack,
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),

                    // Eyebrow
                    Text(
                      'LET’S BEGIN',
                      style: AppTypography.eyebrow,
                    ),

                    const SizedBox(height: 12),

                    // Two-line Hero Title with Italic Accent
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'What brings\nyou ',
                            style: AppTypography.heroTitleSans,
                          ),
                          TextSpan(
                            text: 'here?',
                            style: AppTypography.heroTitleItalic,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Reassuring Subtitle
                    Text(
                      'There’s no right answer. Pick what feels like you.',
                      style: AppTypography.subtitle,
                    ),

                    const SizedBox(height: 24),

                    // 4 Selectable Intention Options
                    ..._options.map((option) {
                      final isSelected = _selectedIntention == option.title;
                      return _buildOptionCard(option, isSelected);
                    }),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Fixed Bottom Continue Button
            Container(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 16),
              color: AppColors.creamCanvas,
              child: PrimaryButton(
                label: 'Continue',
                onPressed: widget.onNext,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(IntentionOption option, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleSelect(option.title),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFEAF1E1) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? const Color(0xFF7E9E67) : AppColors.line,
                width: isSelected ? 1.5 : 1.0,
              ),
              boxShadow: isSelected
                  ? const [
                      BoxShadow(
                        color: Color(0x0C183F35),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                // Option Icon Container
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFDEE9D3)
                        : const Color(0xFFEFF4E8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Icon(
                      option.icon,
                      size: 20,
                      color: const Color(0xFF5E7E49),
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Title & Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option.title,
                        style: AppTypography.floatingNoteTitle.copyWith(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.forest,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        option.subtitle,
                        style: AppTypography.floatingNoteSub.copyWith(
                          fontSize: 11.5,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // Custom Radio Indicator matching the design
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF67884F)
                          : const Color(0xFFCBD7C1),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: isSelected ? 9 : 0,
                      height: isSelected ? 9 : 0,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4F7336),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
