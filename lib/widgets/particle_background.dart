import 'dart:math';
import 'package:flutter/material.dart';

/// Represents a single particle with its properties
class Particle {
  double x;
  double y;
  final double speed;
  final double size;
  final double opacity;
  final bool isHighlighted;
  final double xOffset;
  final double xSpeed;

  Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.opacity,
    required this.isHighlighted,
    required this.xOffset,
    required this.xSpeed,
  });
}

/// Animated background with falling particles that move randomly on X-axis
/// Some particles are highlighted with higher opacity and size for depth effect
class ParticleBackground extends StatefulWidget {
  final bool isDark;
  final int particleCount;

  const ParticleBackground({
    super.key,
    required this.isDark,
    this.particleCount = 50,
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initializeParticles();

    // Animation runs continuously at 60fps
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16), // ~60fps
    )..addListener(_updateParticles);

    _controller.repeat();
  }

  void _initializeParticles() {
    _particles = List.generate(widget.particleCount, (index) {
      // 20% chance for highlighted particles
      final isHighlighted = _random.nextDouble() < 0.2;

      return Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        speed: _random.nextDouble() * 0.0008 + 0.0002, // Slower speed
        size: isHighlighted
            ? _random.nextDouble() * 3 +
                  2 // Larger size for highlighted
            : _random.nextDouble() * 2 + 1,
        opacity: isHighlighted
            ? _random.nextDouble() * 0.4 +
                  0.5 // Higher opacity (0.5-0.9)
            : _random.nextDouble() * 0.2 + 0.1, // Lower opacity (0.1-0.3)
        isHighlighted: isHighlighted,
        xOffset: _random.nextDouble() * 0.1 - 0.05, // Range: -0.05 to 0.05
        xSpeed:
            _random.nextDouble() * 0.0003 + 0.0001, // Slow horizontal movement
      );
    });
  }

  void _updateParticles() {
    setState(() {
      for (var particle in _particles) {
        // Move particle down
        particle.y += particle.speed;

        // Random X-axis movement (oscillating)
        particle.x += sin(particle.y * 10) * particle.xSpeed;

        // Reset particle when it goes off screen
        if (particle.y > 1.0) {
          particle.y = -0.05;
          particle.x = _random.nextDouble();
        }

        // Keep particle within horizontal bounds
        if (particle.x < 0) particle.x = 1.0;
        if (particle.x > 1.0) particle.x = 0.0;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: ParticlePainter(particles: _particles, isDark: widget.isDark),
        child: Container(),
      ),
    );
  }
}

/// Custom painter to draw particles with glow effect for highlighted ones
class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final bool isDark;

  ParticlePainter({required this.particles, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..color = (isDark ? Colors.white : Colors.black).withOpacity(
          particle.opacity,
        )
        ..style = PaintingStyle.fill;

      final position = Offset(
        particle.x * size.width,
        particle.y * size.height,
      );

      // Draw glow effect for highlighted particles
      if (particle.isHighlighted) {
        final glowPaint = Paint()
          ..color = (isDark ? Colors.white : Colors.black).withOpacity(
            particle.opacity * 0.3,
          )
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

        canvas.drawCircle(position, particle.size * 1.5, glowPaint);
      }

      // Draw the particle
      canvas.drawCircle(position, particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) {
    return true; // Always repaint for animation
  }
}
