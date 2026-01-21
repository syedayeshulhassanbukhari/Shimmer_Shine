import 'package:flutter/material.dart';

/// Configuration constants for shimmer and particle animations
/// Modify these values to customize the loading screen appearance and behavior
class ShimmerConstants {
  // Theme Colors
  static const Color darkBackground = Color(0xFF000000); // Jet Black
  static const Color lightBackground = Color(0xFFFFFFFF); // Pure White

  // Shimmer Colors - Dark Theme
  static const Color darkShimmerBase = Color(0xFF1A1A1A);
  static const Color darkShimmerHighlight = Color(0xFF3A3A3A);

  // Shimmer Colors - Light Theme
  static const Color lightShimmerBase = Color(0xFFE0E0E0);
  static const Color lightShimmerHighlight = Color(0xFFF5F5F5);

  // Animation Durations
  static const Duration shimmerDuration = Duration(milliseconds: 1500);
  static const Duration particleFrameDuration = Duration(
    milliseconds: 16,
  ); // ~60fps

  // Particle Configuration
  static const int defaultParticleCount = 50;
  static const double highlightedParticleProbability = 0.2; // 20%

  // Particle Size Ranges
  static const double regularParticleMinSize = 1.0;
  static const double regularParticleMaxSize = 2.0;
  static const double highlightedParticleMinSize = 2.0;
  static const double highlightedParticleMaxSize = 3.0;

  // Particle Opacity Ranges
  static const double regularParticleMinOpacity = 0.1;
  static const double regularParticleMaxOpacity = 0.3;
  static const double highlightedParticleMinOpacity = 0.5;
  static const double highlightedParticleMaxOpacity = 0.9;

  // Particle Speed Ranges
  static const double particleMinSpeed = 0.0002;
  static const double particleMaxSpeed = 0.001;
  static const double particleHorizontalMinSpeed = 0.0001;
  static const double particleHorizontalMaxSpeed = 0.0004;

  // Particle Glow Effect
  static const double glowBlurRadius = 4.0;
  static const double glowRadiusMultiplier = 1.5;
  static const double glowOpacityMultiplier = 0.3;

  // Shimmer Placeholder Sizes
  static const double defaultAvatarSize = 60.0;
  static const double defaultLineHeight = 12.0;
  static const double defaultBorderRadius = 8.0;
  static const double cardBorderRadius = 16.0;

  // Loading Simulation
  static const Duration loadingDuration = Duration(seconds: 5);
}
