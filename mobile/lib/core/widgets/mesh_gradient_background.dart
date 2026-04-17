import 'dart:math';
import 'package:flutter/material.dart';

class MeshGradientBackground extends StatefulWidget {
  final Widget child;
  const MeshGradientBackground({super.key, required this.child});

  @override
  State<MeshGradientBackground> createState() => _MeshGradientBackgroundState();
}

class _MeshGradientBackgroundState extends State<MeshGradientBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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
      builder: (context, child) {
        return CustomPaint(
          painter: _MeshPainter(_controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class _MeshPainter extends CustomPainter {
  final double progress;
  _MeshPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50);

    void drawBlob(Color color, Offset offset, double radius) {
      paint.color = color.withValues(alpha: 0.3);
      canvas.drawCircle(offset, radius, paint);
    }

    final wave1 = sin(progress * 2 * pi);
    final wave2 = cos(progress * 2 * pi);

    // Deep Indigo blob
    drawBlob(
      const Color(0xFF4338CA),
      Offset(size.width * 0.2 + (wave1 * 50), size.height * 0.3 + (wave2 * 30)),
      size.width * 0.8,
    );

    // Cyan blob
    drawBlob(
      const Color(0xFF06B6D4),
      Offset(size.width * 0.8 + (wave2 * 40), size.height * 0.7 + (wave1 * 60)),
      size.width * 0.6,
    );

    // Rose blob (Subtle alert color)
    drawBlob(
      const Color(0xFFF43F5E),
      Offset(size.width * 0.5 + (wave1 * 30), size.height * 0.5 + (wave2 * 50)),
      size.width * 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant _MeshPainter oldDelegate) => oldDelegate.progress != progress;
}
