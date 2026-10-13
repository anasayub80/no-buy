import 'package:flutter/material.dart';

class SproutMascot extends StatefulWidget {
  final double width;
  final double height;
  final bool animate;

  const SproutMascot({
    super.key,
    this.width = 180,
    this.height = 175,
    this.animate = true,
  });

  @override
  State<SproutMascot> createState() => _SproutMascotState();
}

class _SproutMascotState extends State<SproutMascot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _breatheAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );

    if (widget.animate) {
      _controller.repeat(reverse: true);
    }

    _breatheAnimation = Tween<double>(begin: -3.0, end: 3.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _breatheAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, widget.animate ? _breatheAnimation.value : 0),
          child: child,
        );
      },
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: SproutPainter(),
      ),
    );
  }
}

class SproutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Normalizing coordinates from the reference 260 x 250 viewBox
    final double scale = size.width / 260.0;
    canvas.save();
    canvas.scale(scale, scale);

    // 1. Soft Shadow
    final Paint shadowPaint = Paint()
      ..color = const Color(0x1A183F35)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      const Rect.fromLTWH(60, 217, 140, 20),
      shadowPaint,
    );

    // 2. Arms
    final Paint armPaint = Paint()
      ..color = const Color(0xFF9ACB6C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 17
      ..strokeCap = StrokeCap.round;

    final Path leftArm = Path()
      ..moveTo(65, 161)
      ..quadraticBezierTo(30, 143, 36, 132);
    canvas.drawPath(leftArm, armPaint);

    final Path rightArm = Path()
      ..moveTo(195, 158)
      ..quadraticBezierTo(225, 138, 216, 126);
    canvas.drawPath(rightArm, armPaint);

    // 3. Legs
    final Paint legPaint = Paint()
      ..color = const Color(0xFF638E45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(const Offset(93, 211), const Offset(93, 223), legPaint);
    canvas.drawLine(const Offset(163, 211), const Offset(163, 223), legPaint);

    // 4. Main Sprout Body (Rounded pear shape)
    final Paint bodyPaint = Paint()
      ..color = const Color(0xFFBFDF8D)
      ..style = PaintingStyle.fill;

    final Path body = Path()
      ..moveTo(61, 156)
      ..cubicTo(61, 105, 88, 77, 130, 77)
      ..cubicTo(172, 77, 199, 106, 199, 156)
      ..cubicTo(199, 197, 169, 219, 130, 219)
      ..cubicTo(91, 219, 61, 197, 61, 156)
      ..close();
    canvas.drawPath(body, bodyPaint);

    // 5. Light Highlight Curve
    final Paint highlightPaint = Paint()
      ..color = const Color(0xA6F7FFDD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    final Path highlight = Path()
      ..moveTo(79, 126)
      ..cubicTo(86, 104, 98, 95, 111, 93);
    canvas.drawPath(highlight, highlightPaint);

    // 6. Leaves on Top
    final Paint stemPaint = Paint()
      ..color = const Color(0xFF4E8651)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(130, 87), const Offset(130, 57), stemPaint);

    final Paint leftLeafPaint = Paint()
      ..color = const Color(0xFF74B56F)
      ..style = PaintingStyle.fill;
    final Path leftLeaf = Path()
      ..moveTo(130, 70)
      ..cubicTo(83, 76, 76, 34, 76, 34)
      ..cubicTo(118, 25, 134, 54, 130, 70)
      ..close();
    canvas.drawPath(leftLeaf, leftLeafPaint);

    final Paint rightLeafPaint = Paint()
      ..color = const Color(0xFF3E825B)
      ..style = PaintingStyle.fill;
    final Path rightLeaf = Path()
      ..moveTo(130, 61)
      ..cubicTo(175, 63, 188, 22, 188, 22)
      ..cubicTo(145, 12, 127, 40, 130, 61)
      ..close();
    canvas.drawPath(rightLeaf, rightLeafPaint);

    // 7. Eyes
    final Paint eyePaint = Paint()
      ..color = const Color(0xFF183F35)
      ..style = PaintingStyle.fill;
    canvas.drawOval(const Rect.fromLTWH(99, 140, 12, 16), eyePaint);
    canvas.drawOval(const Rect.fromLTWH(149, 140, 12, 16), eyePaint);

    // 8. Cheeks (Soft Peach Blush)
    final Paint cheekPaint = Paint()
      ..color = const Color(0xB3F3AD91)
      ..style = PaintingStyle.fill;
    canvas.drawOval(const Rect.fromLTWH(77, 158, 26, 14), cheekPaint);
    canvas.drawOval(const Rect.fromLTWH(157, 158, 26, 14), cheekPaint);

    // 9. Mouth (Gentle curve)
    final Paint mouthPaint = Paint()
      ..color = const Color(0xFF183F35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final Path mouth = Path()
      ..moveTo(119, 164)
      ..quadraticBezierTo(130, 175, 141, 164);
    canvas.drawPath(mouth, mouthPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
