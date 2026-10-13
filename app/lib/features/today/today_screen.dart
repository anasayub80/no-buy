import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/achievement_preview_card.dart';
import 'widgets/counter_tiles.dart';
import 'widgets/editorial_ritual_card.dart';
import 'widgets/flow_strip.dart';
import 'widgets/keep_the_rhythm_section.dart';
import 'widgets/park_temptation_button.dart';
import 'widgets/ready_to_revisit_section.dart';
import 'widgets/savings_hero_card.dart';
import 'widgets/sprout_companion_card.dart';
import 'widgets/today_header.dart';

class TodayScreen extends StatelessWidget {
  final VoidCallback? onParkTemptation;
  final VoidCallback? onPauseTap;

  const TodayScreen({
    super.key,
    this.onParkTemptation,
    this.onPauseTap,
  });

  void _showActionFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppColors.forest,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 90),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamCanvas,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Brand Header, Avatar, Date Chip, and Hero Headline
              TodayHeader(
                onNotificationsTap: () =>
                    _showActionFeedback(context, 'Reminders & alerts up to date.'),
                onProfileTap: () =>
                    _showActionFeedback(context, 'Your profile & preferences.'),
              ),

              // 1. Sprout Companion Featured Card
              SproutCompanionCard(
                onMeetMe: () =>
                    _showActionFeedback(context, 'Meet your companion: Growth stage 1.'),
                onHeartTap: () =>
                    _showActionFeedback(context, 'A little pause is a lovely start!'),
              ),

              // 2. Primary Capture Action: Park a temptation
              ParkTemptationButton(
                onTap: onParkTemptation ??
                    () => _showActionFeedback(context, 'Save a link to park a temptation.'),
              ),

              // 3. Savings Hero Card ($284.00)
              SavingsHeroCard(
                skippedAmount: 284.00,
                monthSkippedAmount: 0.00,
                onMonthTap: () =>
                    _showActionFeedback(context, 'Monthly anti-haul summary.'),
                onAchievementsTap: () =>
                    _showActionFeedback(context, 'Your badges and achievements.'),
              ),

              // 4. Achievement Preview Card
              AchievementPreviewCard(
                unlockedCount: 0,
                totalCount: 7,
                onTap: () =>
                    _showActionFeedback(context, 'View all 7 achievements.'),
              ),

              // 5. Two-column Stats Tiles
              CounterTiles(
                parkedAmount: 173.00,
                parkedCount: 3,
                monthSavingsAmount: 0.00,
                monthSkipsCount: 0,
                onParkedTap: () =>
                    _showActionFeedback(context, '3 temptations currently cooling off.'),
                onSavingsTap: () =>
                    _showActionFeedback(context, 'Monthly savings breakdown.'),
              ),

              // 6. Ready to revisit Section (2 items waiting)
              ReadyToRevisitSection(
                onItemTap: (item) =>
                    _showActionFeedback(context, 'Revisit "${item.title}"'),
              ),

              // 7. Step Flow Strip (Save — Wait — Decide)
              const FlowStrip(),

              const SizedBox(height: 8),

              // 8. Keep the Rhythm Section (Check-in, Battles, Anti-haul, Set Aside)
              KeepTheRhythmSection(
                onMyProgress: () =>
                    _showActionFeedback(context, 'Your consistency & progress.'),
                onCheckIn: () =>
                    _showActionFeedback(context, 'Daily check-in opened.'),
                onBattle: () =>
                    _showActionFeedback(context, 'No-Buy Battles room opened.'),
                onAntiHaul: () =>
                    _showActionFeedback(context, 'Monthly anti-haul history.'),
                onSetAside: () =>
                    _showActionFeedback(context, '\$90.00 actually set aside.'),
              ),

              // 9. Editorial Ritual Card (Less checkout. More little joys.)
              EditorialRitualCard(
                onTap: () =>
                    _showActionFeedback(context, 'Explore your menu of little joys.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
