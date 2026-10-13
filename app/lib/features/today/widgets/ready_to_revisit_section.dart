import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class RevisitItem {
  final String id;
  final String title;
  final String subtitle;

  const RevisitItem({
    required this.id,
    required this.title,
    required this.subtitle,
  });
}

class ReadyToRevisitSection extends StatelessWidget {
  final List<RevisitItem> items;
  final ValueChanged<RevisitItem>? onItemTap;

  const ReadyToRevisitSection({
    super.key,
    this.items = const [
      RevisitItem(
        id: '1',
        title: 'Still want Glow serum?',
        subtitle: 'Buy thoughtfully, let it go, or wait longer.',
      ),
      RevisitItem(
        id: '2',
        title: 'Still want A little reading lamp?',
        subtitle: 'Buy thoughtfully, let it go, or wait longer.',
      ),
    ],
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with Count Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ready to revisit',
                style: AppTypography.heroTitleSans.copyWith(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                  color: AppColors.forest,
                ),
              ),
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Color(0xFFE2EACF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${items.length}',
                    style: AppTypography.eyebrow.copyWith(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF4C6B37),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Notification Cards
          ...items.map((item) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: const Color(0xFFE1E7DB), width: 1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onItemTap?.call(item),
                    borderRadius: BorderRadius.circular(19),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                      child: Row(
                        children: [
                          // Bell Badge
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF4E7),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications_none_rounded,
                                size: 20,
                                color: Color(0xFF6B8A53),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Text details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'THE WAIT IS OVER',
                                  style: AppTypography.eyebrow.copyWith(
                                    fontSize: 8.5,
                                    letterSpacing: 1.0,
                                    color: const Color(0xFF829273),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  item.title,
                                  style: AppTypography.floatingNoteTitle.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.forest,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.subtitle,
                                  style: AppTypography.floatingNoteSub.copyWith(
                                    fontSize: 9.5,
                                    color: const Color(0xFF7A866E),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Chevron
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 17,
                            color: Color(0xFF8B9B7E),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
