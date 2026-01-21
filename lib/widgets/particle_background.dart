import 'dart:math';
import 'package:flutter/material.dart';

/// Represents a single particle with its properties
/// Each particle has position, movement speed, size, and visual properties
class Particle {
  double x; // Horizontal position (0.0 to 1.0, normalized)
  double y; // Vertical position (0.0 to 1.0, normalized)
  final double speed; // Downward movement speed
  final double size; // Particle radius in pixels  // Particle radius in pixels
  final double opacity; // Transparency level (0.0 to 1.0)
  final bool isHighlighted; // Whether particle has glow effect
  final double xOffset; // Horizontal oscillation offset
  final double xSpeed; // Horizontal movement speed

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

    // Setup animation controller to update particles at ~60fps for smooth motion
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16), // ~60fps
    )..addListener(_updateParticles);

    _controller.repeat();
  }

  void _initializeParticles() {
    _particles = List.generate(widget.particleCount, (index) {
      // Randomly determine if particle should be highlighted (20% probability)
      // Highlighted particles are larger, more opaque, and have a glow effect
      final isHighlighted = _random.nextDouble() < 0.2;

      return Particle(
        x: _random.nextDouble(), // Random horizontal position
        y: _random.nextDouble(), // Random vertical position
        speed: _random.nextDouble() * 0.0008 + 0.0002, // Random downward speed
        size: isHighlighted
            ? _random.nextDouble() * 3 +
                  2 // Larger size for highlighted
            : _random.nextDouble() * 2 + 1,
        opacity: isHighlighted
            ? _random.nextDouble() * 0.4 +
                  0.5 // Higher opacity (0.5-0.9)
            : _random.nextDouble() * 0.2 + 0.1, // More transparent (0.1-0.3)
        isHighlighted: isHighlighted,
        // Random horizontal oscillation offset for varied motion
        xOffset: _random.nextDouble() * 0.1 - 0.05, // Range: -0.05 to 0.05
        // Slow random horizontal movement speed
        xSpeed: _random.nextDouble() * 0.0003 + 0.0001,
      );
    });
  }

  void _updateParticles() {
    setState(() {
      for (var particle in _particles) {
        // Update vertical position (falling downward)
        particle.y += particle.speed;

        // Create wave-like horizontal movement using sine function
        particle.x += sin(particle.y * 10) * particle.xSpeed;

        // When particle falls below screen, reset it to top with random position
        if (particle.y > 1.0) {
          particle.y = -0.05; // Reset above screen
          particle.x = _random.nextDouble(); // New random horizontal position
        }

        // Wrap particles that move off screen horizontally
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
    // RepaintBoundary optimizes rendering by isolating repaints to this widget
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
    // Draw each particle on the canvas
    for (var particle in particles) {
      // Configure paint for particle color and opacity
      final paint = Paint()
        ..color = (isDark ? Colors.white : Colors.black).withOpacity(
          particle.opacity,
        )
        ..style = PaintingStyle.fill;
      // Convert normalized position (0-1) to actual screen coordinates
      final position = Offset(
        particle.x * size.width, // Scale to widget width
        particle.y * size.height, // Scale to widget height
      );

      // Add glow/blur effect for highlighted particles to create depth
      if (particle.isHighlighted) {
        // Configure paint with blur filter for glow effect
        final glowPaint = Paint()
          ..color = (isDark ? Colors.white : Colors.black).withOpacity(
            particle.opacity * 0.3, // Reduced opacity for subtle glow
          )
          // Apply Gaussian blur for glow effect
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

        // Draw larger circle with blur for glow effect
        canvas.drawCircle(position, particle.size * 1.5, glowPaint);
      }

      // Draw the actual particle circle
      canvas.drawCircle(position, particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) {
    // Always return true to repaint every frame for smooth animation
    return true;
  }
}
