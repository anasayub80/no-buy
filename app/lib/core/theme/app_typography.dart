import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  // Brand Header Logo
  static TextStyle brandTitle = GoogleFonts.lora(
    fontSize: 27,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: AppColors.forest,
  );

  static TextStyle exploreLink = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.forest,
  );

  // Onboarding Hero Titles
  static TextStyle heroTitleSans = GoogleFonts.plusJakartaSans(
    fontSize: 33,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.2,
    height: 1.1,
    color: AppColors.forest,
  );

  static TextStyle heroTitleItalic = GoogleFonts.newsreader(
    fontSize: 35,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.8,
    height: 1.12,
    color: AppColors.accentOlive,
  );

  // Subtitle
  static TextStyle subtitle = GoogleFonts.plusJakartaSans(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    height: 1.65,
    color: AppColors.muted,
  );

  // Floating Note Card
  static TextStyle floatingNoteTitle = GoogleFonts.plusJakartaSans(
    fontSize: 11.5,
    fontWeight: FontWeight.w700,
    color: AppColors.forest,
    height: 1.3,
  );

  static TextStyle floatingNoteSub = GoogleFonts.plusJakartaSans(
    fontSize: 9.5,
    fontWeight: FontWeight.w400,
    color: AppColors.muted,
    height: 1.4,
  );

  // Pagination Counter
  static TextStyle paginationCounter = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: AppColors.mutedLight,
  );

  // Button Labels
  static TextStyle buttonPrimary = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static TextStyle buttonGhost = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.muted,
  );

  // Eyebrow
  static TextStyle eyebrow = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.6,
    color: AppColors.muted,
  );

  // Form Field Label
  static TextStyle formLabel = GoogleFonts.plusJakartaSans(
    fontSize: 12.5,
    fontWeight: FontWeight.w700,
    color: AppColors.forest,
  );

  // Input Hint Text
  static TextStyle inputHint = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    height: 1.5,
    color: AppColors.muted,
  );

  // Note Card Text
  static TextStyle noteCard = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    height: 1.55,
    color: AppColors.ink,
  );

  // Footer Note
  static TextStyle footerNote = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    height: 1.55,
    color: AppColors.muted,
  );
}
