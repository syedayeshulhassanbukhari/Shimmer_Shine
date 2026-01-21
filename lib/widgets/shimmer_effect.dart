import 'package:flutter/material.dart';

/// Custom shimmer effect widget that animates a gradient from left to right
/// Supports both light and dark themes with appropriate color schemes
class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final bool isDark;

  const ShimmerEffect({super.key, required this.child, required this.isDark});

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(
      begin: -2,
      end: 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.5, 1.0],
              colors: widget.isDark
                  ? [
                      const Color(0xFF1A1A1A), // Dark grey base
                      const Color(0xFF3A3A3A), // Lighter grey shimmer
                      const Color(0xFF1A1A1A), // Dark grey base
                    ]
                  : [
                      const Color(0xFFE0E0E0), // Light grey base
                      const Color(0xFFF5F5F5), // Almost white shimmer
                      const Color(0xFFE0E0E0), // Light grey base
                    ],
              transform: _SlidingGradientTransform(
                slidePercent: _animation.value,
              ),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// Transform for animating the gradient position
class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

/// Shimmer placeholder for circular avatar
class ShimmerCircle extends StatelessWidget {
  final double size;

  const ShimmerCircle({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE0E0E0),
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Shimmer placeholder for rectangular boxes (cards, images, etc.)
class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE0E0E0),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
    );
  }
}

/// Shimmer placeholder for text lines
class ShimmerLine extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLine({super.key, required this.width, this.height = 12});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
