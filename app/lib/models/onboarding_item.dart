import 'package:flutter/material.dart';
import '../core/constants/app_assets.dart';

class OnboardingItem {
  final int index;
  final String screenId;
  final String screenNumber;
  final String titleBold;
  final String titleItalic;
  final String subtitle;
  final String imageAsset;
  final IconData floatingNoteIcon;
  final String floatingNoteTitle;
  final String floatingNoteSubtitle;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final bool isPeachTone;

  const OnboardingItem({
    required this.index,
    required this.screenId,
    required this.screenNumber,
    required this.titleBold,
    required this.titleItalic,
    required this.subtitle,
    required this.imageAsset,
    required this.floatingNoteIcon,
    required this.floatingNoteTitle,
    required this.floatingNoteSubtitle,
    required this.primaryButtonLabel,
    required this.secondaryButtonLabel,
    this.isPeachTone = false,
  });

  static const List<OnboardingItem> items = [
    OnboardingItem(
      index: 0,
      screenId: 'welcome',
      screenNumber: '01 / 04',
      titleBold: 'Want it?',
      titleItalic: 'Wait on it.',
      subtitle:
          'Put it in Lessly before you put it in your cart. Save the link, wait, then choose.',
      imageAsset: AppAssets.sproutCompanion,
      floatingNoteIcon: Icons.favorite_border_rounded,
      floatingNoteTitle: 'One thoughtful little choice.',
      floatingNoteSubtitle: 'Your pace. Your rules.',
      primaryButtonLabel: 'Find my calmer pace',
      secondaryButtonLabel: 'Take a look around',
      isPeachTone: false,
    ),
    OnboardingItem(
      index: 1,
      screenId: 'intro-pause',
      screenNumber: '02 / 04',
      titleBold: 'Save it now.',
      titleItalic: 'Decide later.',
      subtitle:
          'Save the product link. Choose 3 days or a week to revisit it. Then decide if you still want it.',
      imageAsset: AppAssets.pauseSculpture,
      floatingNoteIcon: Icons.eco_outlined,
      floatingNoteTitle: 'A want can wait.',
      floatingNoteSubtitle: '3 days, 1 week. Your own pace.',
      primaryButtonLabel: 'Continue',
      secondaryButtonLabel: 'Back',
      isPeachTone: false,
    ),
    OnboardingItem(
      index: 2,
      screenId: 'intro-clarity',
      screenNumber: '03 / 04',
      titleBold: 'Know the cost.',
      titleItalic: 'Remember enough.',
      subtitle:
          'See the price in perspective, check your own rules, and rediscover a suitable thing you own.',
      imageAsset: AppAssets.enoughWardrobe,
      floatingNoteIcon: Icons.door_sliding_outlined,
      floatingNoteTitle: 'Good things, already yours.',
      floatingNoteSubtitle: 'Use it. Enjoy it. Rediscover it.',
      primaryButtonLabel: 'Continue',
      secondaryButtonLabel: 'Back',
      isPeachTone: false,
    ),
    OnboardingItem(
      index: 3,
      screenId: 'intro-grow',
      screenNumber: '04 / 04',
      titleBold: 'Small choices.',
      titleItalic: 'Meaningful freedom.',
      subtitle:
          'Give money you actually set aside a purpose. Skipped purchase costs stay separate from real savings.',
      imageAsset: AppAssets.littleEscape,
      floatingNoteIcon: Icons.near_me_outlined,
      floatingNoteTitle: 'Make room for what matters.',
      floatingNoteSubtitle: 'Your goals. Your confirmations.',
      primaryButtonLabel: 'Choose my intention',
      secondaryButtonLabel: 'Back',
      isPeachTone: true,
    ),
  ];
}
