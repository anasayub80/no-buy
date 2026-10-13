import 'package:flutter_test/flutter_test.dart';
import 'package:lessly/features/navigation/main_navigation_scaffold.dart';
import 'package:lessly/main.dart';
import 'package:lessly/widgets/app_buttons.dart';

void main() {
  testWidgets('Complete 8 Starting Screens flow and Today Dashboard test', (WidgetTester tester) async {
    // 1. Build LesslyApp and trigger initial frames
    await tester.pumpWidget(const LesslyApp());
    await tester.pump(const Duration(milliseconds: 100));

    // Screen 01: Welcome
    expect(find.text('lessly'), findsOneWidget);
    expect(find.text('One thoughtful little choice.'), findsOneWidget);
    expect(find.text('Find my calmer pace'), findsOneWidget);

    // Navigate to Screen 02: Save now decide later
    await tester.tap(find.text('Find my calmer pace'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('A want can wait.'), findsOneWidget);

    // Navigate to Screen 03: The clarity
    await tester.tap(find.widgetWithText(PrimaryButton, 'Continue'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Good things, already yours.'), findsOneWidget);

    // Navigate to Screen 04: The growth
    await tester.tap(find.widgetWithText(PrimaryButton, 'Continue'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Make room for what matters.'), findsOneWidget);

    // Navigate to Screen 05: Your intention
    await tester.tap(find.text('Choose my intention'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Your intention'), findsOneWidget);

    // Select 'Build a little freedom'
    await tester.tap(find.text('Build a little freedom'));
    await tester.pump(const Duration(milliseconds: 100));

    // Navigate to Screen 06: Your preferences
    await tester.tap(find.widgetWithText(PrimaryButton, 'Continue').last);
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Your preferences'), findsOneWidget);

    // Navigate to Screen 07: Gentle reminders
    await tester.tap(find.widgetWithText(PrimaryButton, 'Continue').last);
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Gentle reminders'), findsOneWidget);

    // Navigate to Screen 08: You're ready
    await tester.tap(find.text('Choose my reminders'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('A fresh beginning'), findsOneWidget);
    expect(find.text('Try a gentle seven-day start'), findsOneWidget);

    // 2. Navigate into Today Dashboard
    await tester.tap(find.text('Try a gentle seven-day start'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }

    // Verify Main Today Dashboard elements
    expect(find.byType(MainNavigationScaffold), findsOneWidget);
    expect(find.text('YOUR SHOPPING DETOX'), findsOneWidget);
    expect(find.text('Oct 13'), findsOneWidget);
    expect(find.text('YOUR LITTLE PAUSE PAL'), findsOneWidget);
    expect(find.text('Park a temptation'), findsOneWidget);
    expect(find.text('\$284.00'), findsOneWidget);
    expect(find.text('0 / 7 ACHIEVEMENTS'), findsOneWidget);
    expect(find.text('Temptations parked'), findsOneWidget);
    expect(find.text('Savings this month'), findsOneWidget);
    expect(find.text('Ready to revisit'), findsOneWidget);
    expect(find.text('Still want Glow serum?'), findsOneWidget);
    expect(find.text('Still want A little reading lamp?'), findsOneWidget);
    expect(find.text('Keep the rhythm'), findsOneWidget);
    expect(find.text('NO-BUY BATTLES'), findsOneWidget);
    expect(find.text('This month’s anti-haul'), findsOneWidget);
    expect(find.text('Actually set aside'), findsOneWidget);
    expect(find.text('GOOD THINGS, ALREADY HERE'), findsOneWidget);

    // Verify Bottom Navigation Items
    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Challenges'), findsOneWidget);
    expect(find.text('Pause'), findsOneWidget);
    expect(find.text('Wants'), findsOneWidget);
    expect(find.text('Patterns'), findsOneWidget);
  });
}
