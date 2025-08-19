import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';

class AnimatedBorderContainer extends StatefulWidget {
  final Widget child;
  const AnimatedBorderContainer({super.key, required this.child});

  @override
  State<AnimatedBorderContainer> createState() => _AnimatedBorderContainerState();
}

class _AnimatedBorderContainerState extends State<AnimatedBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // sekinroq aylanish
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: BorderPainter(progress: _controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class BorderPainter extends CustomPainter {
  final double progress;
  BorderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.w, 0.h, size.width, size.height);
    final radius = 14.0.r;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.w
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: 6.28, // 2*pi
        colors: [
          AppColors.pinkFFC6C9,
          Colors.red.withOpacity(0.2),
          AppColors.pinkFFC6C9,
        ],
        stops: [progress, progress + 0.1, progress + 0.2],
        transform: GradientRotation(progress * 6.28),
      ).createShader(rect);

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
