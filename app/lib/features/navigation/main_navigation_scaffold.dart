import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../today/today_screen.dart';

class MainNavigationScaffold extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScaffold({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationScaffold> createState() => _MainNavigationScaffoldState();
}

class _MainNavigationScaffoldState extends State<MainNavigationScaffold> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index != 0) {
      final names = ['Today', 'Challenges', 'Pause Studio', 'Wants Waiting Room', 'Patterns'];
      _showTabPlaceholder(names[index]);
    }
  }

  void _showTabPlaceholder(String tabName) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$tabName destination opened.',
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppColors.forest,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 90),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamCanvas,
      body: Stack(
        children: [
          // Screen Body
          IndexedStack(
            index: _currentIndex,
            children: [
              // Tab 0: Today
              TodayScreen(
                onPauseTap: () => _onTabSelected(2),
              ),

              // Tab 1: Challenges Placeholder
              _buildPlaceholderView('Challenges', 'A promise, not a punishment. Your pace, your rules.'),

              // Tab 2: Pause Studio Placeholder
              _buildPlaceholderView('90-Second Pause', 'Keep the choice. Lose the rush.'),

              // Tab 3: Wants Waiting Room Placeholder
              _buildPlaceholderView('Wants Waiting Room', 'A want can wait. Revisit when you are ready.'),

              // Tab 4: Patterns Analytics Placeholder
              _buildPlaceholderView('Patterns', 'Every honest day counts. Lasting consistency.'),
            ],
          ),

          // Custom Docked Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderView(String title, String subtitle) {
    return Scaffold(
      backgroundColor: AppColors.creamCanvas,
      appBar: AppBar(
        backgroundColor: AppColors.creamCanvas,
        elevation: 0,
        title: Text(title, style: AppTypography.heroTitleSans.copyWith(fontSize: 18)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFF4E8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.eco_rounded, color: AppColors.forest, size: 30),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: AppTypography.heroTitleSans.copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: AppTypography.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFEFEF9),
        border: Border(
          top: BorderSide(color: AppColors.line, width: 1.0),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 1. Today
              _buildNavItem(
                index: 0,
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: 'Today',
              ),

              // 2. Challenges
              _buildNavItem(
                index: 1,
                icon: Icons.outlined_flag_rounded,
                activeIcon: Icons.flag_rounded,
                label: 'Challenges',
              ),

              // 3. Pause (Elevated circular centerpiece)
              _buildCenterPauseItem(),

              // 4. Wants
              _buildNavItem(
                index: 3,
                icon: Icons.favorite_border_rounded,
                activeIcon: Icons.favorite_rounded,
                label: 'Wants',
              ),

              // 5. Patterns
              _buildNavItem(
                index: 4,
                icon: Icons.bar_chart_rounded,
                activeIcon: Icons.bar_chart_rounded,
                label: 'Patterns',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isActive = _currentIndex == index;

    return InkWell(
      onTap: () => _onTabSelected(index),
      child: SizedBox(
        width: 58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Active top indicator bar
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isActive ? 24 : 0,
              height: 3,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                color: AppColors.forest,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Icon(
              isActive ? activeIcon : icon,
              size: 21,
              color: isActive ? AppColors.forest : const Color(0xFF657360),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 8.5,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppColors.forest : const Color(0xFF657360),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterPauseItem() {
    final isActive = _currentIndex == 2;

    return Transform.translate(
      offset: const Offset(0, -12),
      child: InkWell(
        onTap: () => _onTabSelected(2),
        borderRadius: BorderRadius.circular(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.forest,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.creamCanvas,
                  width: 4,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x18183F35),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.pause_rounded,
                  size: 24,
                  color: AppColors.mint,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Pause',
              style: TextStyle(
                fontSize: 8.5,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppColors.forest : const Color(0xFF657360),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
