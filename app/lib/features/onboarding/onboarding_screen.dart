import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../models/onboarding_item.dart';
import '../../models/user_preferences.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/brand_header.dart';
import 'onboarding_page.dart';
import 'screens/intention_screen.dart';
import 'screens/preferences_screen.dart';
import 'screens/ready_screen.dart';
import 'screens/reminders_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final UserPreferences _preferences = UserPreferences();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    _preferences.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  void _handlePrimaryAction() {
    if (_currentIndex < OnboardingItem.items.length - 1) {
      _goToPage(_currentIndex + 1);
    } else {
      // 04 The growth -> Navigate to 05 Your intention
      _navigateToIntentionScreen();
    }
  }

  void _handleSecondaryAction() {
    if (_currentIndex == 0) {
      // Screen 01: "Take a look around"
      _showExploreBottomSheet();
    } else {
      // Screens 02-04: "Back"
      _goToPage(_currentIndex - 1);
    }
  }

  void _navigateToIntentionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntentionScreen(
          preferences: _preferences,
          onBack: () => Navigator.pop(context),
          onNext: _navigateToPreferencesScreen,
        ),
      ),
    );
  }

  void _navigateToPreferencesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreferencesScreen(
          preferences: _preferences,
          onBack: () => Navigator.pop(context),
          onNext: _navigateToRemindersScreen,
        ),
      ),
    );
  }

  void _navigateToRemindersScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RemindersScreen(
          preferences: _preferences,
          onBack: () => Navigator.pop(context),
          onNext: _navigateToReadyScreen,
        ),
      ),
    );
  }

  void _navigateToReadyScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReadyScreen(
          preferences: _preferences,
          onBack: () => Navigator.pop(context),
          onTrySevenDayStart: () => _showCompletionDialog('A gentle seven-day starter challenge has begun!'),
          onCreateChallenge: () => _showCompletionDialog('Custom challenge creation unlocked!'),
          onLookAround: () => _showCompletionDialog('Welcome to your Lessly dashboard!'),
        ),
      ),
    );
  }

  void _showCompletionDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cream,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: AppColors.forest,
              size: 26,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                'Starting Journey Complete',
                style: AppTypography.heroTitleSans.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTypography.subtitle.copyWith(color: AppColors.forest, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Selected Intention: ${_preferences.intention}\nCurrency: ${_preferences.currency} · Hourly Rate: ${_preferences.hourlyRate.isNotEmpty ? "${_preferences.currency}${_preferences.hourlyRate}" : "None"}',
              style: AppTypography.inputHint,
            ),
          ],
        ),
        actions: [
          PrimaryButton(
            label: 'Back to start',
            showArrow: false,
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              _goToPage(0);
            },
          ),
        ],
      ),
    );
  }

  void _showExploreBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          decoration: const BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.line,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.forest,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.eco_rounded,
                      color: AppColors.mint,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Explore All 8 Starting Screens',
                    style: AppTypography.heroTitleSans.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Jump directly to any of the 8 starting screens from the START HERE journey:',
                style: AppTypography.subtitle,
              ),
              const SizedBox(height: 16),

              // Screens 01 - 04
              ...OnboardingItem.items.map((item) {
                final isSelected = item.index == _currentIndex;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE8EFDD) : Colors.white,
                    border: Border.all(
                      color: isSelected ? AppColors.forest : AppColors.line,
                      width: isSelected ? 1.5 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: Text(
                      item.screenNumber.split(' ')[0],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? AppColors.forest : AppColors.muted,
                      ),
                    ),
                    title: Text(
                      '${item.titleBold} ${item.titleItalic}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.forest,
                        fontSize: 13,
                      ),
                    ),
                    subtitle: Text(
                      item.floatingNoteTitle,
                      style: TextStyle(color: AppColors.muted, fontSize: 11),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      size: 18,
                      color: AppColors.muted,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _goToPage(item.index);
                    },
                  ),
                );
              }),

              // Screen 05: Your intention
              _buildExploreScreenTile(
                number: '05',
                title: 'Your intention',
                subtitle: 'What brings you here?',
                onTap: () {
                  Navigator.pop(context);
                  _navigateToIntentionScreen();
                },
              ),

              // Screen 06: Your preferences
              _buildExploreScreenTile(
                number: '06',
                title: 'Your preferences',
                subtitle: 'Make it your own (currency & hourly rate)',
                onTap: () {
                  Navigator.pop(context);
                  _navigateToPreferencesScreen();
                },
              ),

              // Screen 07: Gentle reminders
              _buildExploreScreenTile(
                number: '07',
                title: 'Gentle reminders',
                subtitle: 'A reminder. Never a guilt trip.',
                onTap: () {
                  Navigator.pop(context);
                  _navigateToRemindersScreen();
                },
              ),

              // Screen 08: You\'re ready
              _buildExploreScreenTile(
                number: '08',
                title: 'You’re ready',
                subtitle: 'Your softer start is here.',
                onTap: () {
                  Navigator.pop(context);
                  _navigateToReadyScreen();
                },
              ),

              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Close',
                showArrow: false,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExploreScreenTile({
    required String number,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.line, width: 1.0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        dense: true,
        leading: Text(
          number,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.muted,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.forest,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.muted, fontSize: 11),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          size: 18,
          color: AppColors.muted,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = OnboardingItem.items[_currentIndex];

    return Scaffold(
      backgroundColor: AppColors.creamCanvas,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Brand and Explore Action
            BrandHeader(
              onExplore: _showExploreBottomSheet,
            ),

            // Swipable Onboarding Pages (01-04)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: OnboardingItem.items.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    item: OnboardingItem.items[index],
                    onSelectPage: _goToPage,
                  );
                },
              ),
            ),

            // Fixed Bottom Actions
            Container(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 12),
              color: AppColors.creamCanvas,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                    label: currentItem.primaryButtonLabel,
                    onPressed: _handlePrimaryAction,
                  ),
                  const SizedBox(height: 4),
                  GhostButton(
                    label: currentItem.secondaryButtonLabel,
                    onPressed: _handleSecondaryAction,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
