import 'package:flutter/material.dart';
import '../../../core/theme/app_typography.dart';

class FlowStrip extends StatelessWidget {
  const FlowStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStep(Icons.link_rounded, 'Save'),
          _buildDivider(),
          _buildStep(Icons.schedule_rounded, 'Wait'),
          _buildDivider(),
          _buildStep(Icons.eco_rounded, 'Decide'),
        ],
      ),
    );
  }

  Widget _buildStep(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF6B7D61)),
        const SizedBox(width: 5),
        Text(
          label,
          style: AppTypography.floatingNoteTitle.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF6B7D61),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 16,
      height: 1,
      color: const Color(0xFFCDD9C3),
    );
  }
}
