import 'package:flutter/material.dart';
import '../constants/index.dart';

class AppAnimations {
  // Animation Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // Animation Curves
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeIn = Curves.easeIn;
  static const Curve bounce = Curves.bounceOut;
  static const Curve elastic = Curves.elasticOut;

  // Fade Animations
  static Widget fadeIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeInOut,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: begin, end: end),
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: child,
    );
  }

  static Widget fadeInUp({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 30.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(0, offset), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: TweenAnimationBuilder<double>(
            duration: duration,
            curve: curve,
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, opacity, child) {
              return Opacity(opacity: opacity, child: child);
            },
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  static Widget fadeInDown({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 30.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(0, -offset), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: TweenAnimationBuilder<double>(
            duration: duration,
            curve: curve,
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, opacity, child) {
              return Opacity(opacity: opacity, child: child);
            },
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  static Widget fadeInLeft({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 30.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(-offset, 0), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: TweenAnimationBuilder<double>(
            duration: duration,
            curve: curve,
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, opacity, child) {
              return Opacity(opacity: opacity, child: child);
            },
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  static Widget fadeInRight({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 30.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(offset, 0), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: TweenAnimationBuilder<double>(
            duration: duration,
            curve: curve,
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, opacity, child) {
              return Opacity(opacity: opacity, child: child);
            },
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  // Scale Animations
  static Widget scaleIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: begin, end: end),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }

  static Widget scaleInBounce({
    required Widget child,
    Duration duration = slow,
    Curve curve = bounce,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }

  // Slide Animations
  static Widget slideInUp({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(0, offset), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }

  static Widget slideInDown({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(0, -offset), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }

  static Widget slideInLeft({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(-offset, 0), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }

  static Widget slideInRight({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double offset = 50.0,
  }) {
    return TweenAnimationBuilder<Offset>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: Offset(offset, 0), end: Offset.zero),
      builder: (context, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }

  // Rotation Animations
  static Widget rotateIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = easeOut,
    double begin = -0.5,
    double end = 0.0,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: begin, end: end),
      builder: (context, value, child) {
        return Transform.rotate(angle: value, child: child);
      },
      child: child,
    );
  }

  // Pulse Animation
  static Widget pulse({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1000),
    double minScale = 0.95,
    double maxScale = 1.05,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: minScale, end: maxScale),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      onEnd: () {
        // This would need to be handled by a parent widget for continuous animation
      },
      child: child,
    );
  }

  // Shake Animation
  static Widget shake({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    double offset = 10.0,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        final shake = offset * (0.5 - (value - 0.5).abs());
        return Transform.translate(offset: Offset(shake, 0), child: child);
      },
      child: child,
    );
  }

  // Staggered Animation for Lists
  static Widget staggeredList({
    required List<Widget> children,
    Duration staggerDelay = const Duration(milliseconds: 100),
    Duration itemDuration = normal,
    Curve curve = easeOut,
    double offset = 30.0,
  }) {
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;

        return TweenAnimationBuilder<Offset>(
          duration: Duration(
            milliseconds:
                itemDuration.inMilliseconds +
                (index * staggerDelay.inMilliseconds),
          ),
          curve: curve,
          tween: Tween(begin: Offset(0, offset), end: Offset.zero),
          builder: (context, value, child) {
            return Transform.translate(
              offset: value,
              child: TweenAnimationBuilder<double>(
                duration: Duration(
                  milliseconds:
                      itemDuration.inMilliseconds +
                      (index * staggerDelay.inMilliseconds),
                ),
                curve: curve,
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, opacity, child) {
                  return Opacity(opacity: opacity, child: child);
                },
                child: child,
              ),
            );
          },
          child: child,
        );
      }).toList(),
    );
  }

  // Loading Animations
  static Widget loadingDots({
    Color color = AppColors.primary,
    double size = 8.0,
    Duration duration = const Duration(milliseconds: 600),
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return TweenAnimationBuilder<double>(
          duration: duration,
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            final delay = index * 0.2;
            final animationValue = (value - delay).clamp(0.0, 1.0);
            final scale = 0.5 + (0.5 * (0.5 - (animationValue - 0.5).abs()));

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  static Widget loadingSpinner({
    Color color = AppColors.primary,
    double size = 24.0,
    double strokeWidth = 2.0,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(color: color, strokeWidth: strokeWidth),
    );
  }

  // Success Animation
  static Widget successCheckmark({
    Color color = AppColors.success,
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return CustomPaint(
          size: Size(size, size),
          painter: SuccessCheckmarkPainter(progress: value, color: color),
        );
      },
    );
  }

  // Error Animation
  static Widget errorX({
    Color color = AppColors.error,
    double size = 48.0,
    Duration duration = const Duration(milliseconds: 600),
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return CustomPaint(
          size: Size(size, size),
          painter: ErrorXPainter(progress: value, color: color),
        );
      },
    );
  }
}

// Custom Painters for Success and Error Animations
class SuccessCheckmarkPainter extends CustomPainter {
  final double progress;
  final Color color;

  SuccessCheckmarkPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Draw circle
    canvas.drawCircle(center, radius, paint);

    // Draw checkmark
    if (progress > 0.3) {
      final checkProgress = ((progress - 0.3) / 0.7).clamp(0.0, 1.0);

      final path = Path();
      path.moveTo(center.dx - radius * 0.3, center.dy);
      path.lineTo(center.dx - radius * 0.1, center.dy + radius * 0.2);
      path.lineTo(center.dx + radius * 0.3, center.dy - radius * 0.2);

      final pathMetrics = path.computeMetrics();
      final pathLength = pathMetrics.first.length;
      final animatedLength = pathLength * checkProgress;

      final animatedPath = pathMetrics.first.extractPath(0, animatedLength);
      canvas.drawPath(animatedPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ErrorXPainter extends CustomPainter {
  final double progress;
  final Color color;

  ErrorXPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Draw circle
    canvas.drawCircle(center, radius, paint);

    // Draw X
    if (progress > 0.3) {
      final xProgress = ((progress - 0.3) / 0.7).clamp(0.0, 1.0);
      final xRadius = radius * 0.6;

      // First diagonal
      final start1 = Offset(center.dx - xRadius, center.dy - xRadius);
      final end1 = Offset(center.dx + xRadius, center.dy + xRadius);
      final animatedEnd1 = Offset.lerp(start1, end1, xProgress)!;
      canvas.drawLine(start1, animatedEnd1, paint);

      // Second diagonal
      final start2 = Offset(center.dx + xRadius, center.dy - xRadius);
      final end2 = Offset(center.dx - xRadius, center.dy + xRadius);
      final animatedEnd2 = Offset.lerp(start2, end2, xProgress)!;
      canvas.drawLine(start2, animatedEnd2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
