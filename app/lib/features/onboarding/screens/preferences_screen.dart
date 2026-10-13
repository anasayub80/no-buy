import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../models/user_preferences.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/screen_header.dart';

class PreferencesScreen extends StatefulWidget {
  final UserPreferences preferences;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const PreferencesScreen({
    super.key,
    required this.preferences,
    required this.onBack,
    required this.onNext,
  });

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  static const List<String> _currencies = [
    'USD',
    'GBP',
    'EUR',
    'PKR',
    'CAD',
    'AUD',
  ];

  late String _selectedCurrency;
  late TextEditingController _rateController;

  @override
  void initState() {
    super.initState();
    _selectedCurrency = widget.preferences.currency;
    _rateController = TextEditingController(text: widget.preferences.hourlyRate);
  }

  @override
  void dispose() {
    _rateController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    widget.preferences.currency = _selectedCurrency;
    widget.preferences.hourlyRate = _rateController.text.trim();
    widget.onNext();
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
              title: 'Your preferences',
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
                      'A PERSONAL PERSPECTIVE',
                      style: AppTypography.eyebrow,
                    ),

                    const SizedBox(height: 12),

                    // Two-line Hero Title with Italic Accent
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Make it\n',
                            style: AppTypography.heroTitleSans,
                          ),
                          TextSpan(
                            text: 'your own.',
                            style: AppTypography.heroTitleItalic,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      'A few details help put your choices in context.',
                      style: AppTypography.subtitle,
                    ),

                    const SizedBox(height: 28),

                    // Field 1: Currency Selector
                    Text(
                      'Your currency',
                      style: AppTypography.formLabel,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFDCE1D3)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCurrency,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.muted,
                            size: 22,
                          ),
                          style: AppTypography.floatingNoteTitle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.forest,
                          ),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          items: _currencies.map((currency) {
                            return DropdownMenuItem<String>(
                              value: currency,
                              child: Text(currency),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedCurrency = value;
                              });
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Field 2: Take-home hourly rate
                    Text(
                      'Take-home hourly rate (optional)',
                      style: AppTypography.formLabel,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _rateController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: AppTypography.floatingNoteTitle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.forest,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Color(0xFFDCE1D3)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Color(0xFFDCE1D3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: AppColors.forest,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Use an estimate after tax. Leave blank to hide work hours. Changing currency relabels demo amounts; it does not convert them.',
                      style: AppTypography.inputHint,
                    ),

                    const SizedBox(height: 24),

                    // Info Note Card (No bank connection needed)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF3E8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE2E9DA),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.lock_outline_rounded,
                              size: 15,
                              color: AppColors.muted,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'No bank connection or account is needed for this prototype. All demo changes stay in this browser.',
                              style: AppTypography.noteCard,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
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
                onPressed: _handleContinue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
