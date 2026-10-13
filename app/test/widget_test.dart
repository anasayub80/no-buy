import 'package:flutter_test/flutter_test.dart';
import 'package:lessly/main.dart';
import 'package:lessly/widgets/app_buttons.dart';

void main() {
  testWidgets('Complete 8 Starting Screens flow test', (WidgetTester tester) async {
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
    expect(find.text('Choose my intention'), findsOneWidget);

    // Navigate to Screen 05: Your intention
    await tester.tap(find.text('Choose my intention'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Your intention'), findsOneWidget);
    expect(find.text('LET’S BEGIN'), findsOneWidget);
    expect(find.text('Spend with intention'), findsOneWidget);
    expect(find.text('Build a little freedom'), findsOneWidget);

    // Select 'Build a little freedom'
    await tester.tap(find.text('Build a little freedom'));
    await tester.pump(const Duration(milliseconds: 100));

    // Navigate to Screen 06: Your preferences
    await tester.tap(find.widgetWithText(PrimaryButton, 'Continue').last);
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Your preferences'), findsOneWidget);
    expect(find.text('A PERSONAL PERSPECTIVE'), findsOneWidget);
    expect(find.text('Your currency'), findsOneWidget);
    expect(find.text('Take-home hourly rate (optional)'), findsOneWidget);

    // Navigate to Screen 07: Gentle reminders
    await tester.tap(find.widgetWithText(PrimaryButton, 'Continue').last);
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('Gentle reminders'), findsOneWidget);
    expect(find.text('ONLY A LITTLE NUDGE'), findsOneWidget);
    expect(find.text('Choose my reminders'), findsOneWidget);
    expect(find.text('Maybe later'), findsOneWidget);

    // Navigate to Screen 08: You're ready
    await tester.tap(find.text('Choose my reminders'));
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(find.text('A fresh beginning'), findsOneWidget);
    expect(find.text('YOU’VE MADE ROOM'), findsOneWidget);
    expect(find.text('Your own kind of beginning.'), findsOneWidget);
    expect(find.text('Try a gentle seven-day start'), findsOneWidget);
    expect(find.text('Create my own challenge'), findsOneWidget);

    // Verify personalized subtitle reflects the chosen intention
    expect(find.textContaining('Build a little freedom'), findsOneWidget);
  });
}
