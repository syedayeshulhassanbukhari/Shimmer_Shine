import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../widgets/particle_background.dart';

/// Main shimmer loading screen that combines particle animations with skeleton shimmer
/// Automatically adapts to light and dark themes using Skeletonizer package
class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Automatically detect current theme to adjust colors accordingly
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF000000)
        : const Color(0xFFFFFFFF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Background layer: Animated particles for visual interest
          Positioned.fill(
            child: ParticleBackground(isDark: isDark, particleCount: 50),
          ),

          // Foreground layer: Skeleton UI with shimmer animation
          SafeArea(
            child: Skeletonizer(
              enabled: true, // Enable skeleton effect
              enableSwitchAnimation: true, // Smooth transition when toggling
              // Customize shimmer colors based on theme
              effect: ShimmerEffect(
                // Base color: darker in dark mode, lighter in light mode
                baseColor: isDark
                    ? const Color(0xFF1A1A1A) // Very dark grey for dark theme
                    : const Color(0xFFE0E0E0), // Light grey for light theme
                // Highlight color: creates the moving shimmer effect
                highlightColor: isDark
                    ? const Color(0xFF3A3A3A) // Medium grey for dark theme
                    : const Color(0xFFF5F5F5), // White for light theme
                // Animation duration for one complete shimmer cycle
                duration: const Duration(milliseconds: 1500),
              ),
              child: _buildSkeletonContent(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the skeleton loading UI with real widget structure
  Widget _buildSkeletonContent(BuildContext context) {
    return SingleChildScrollView(
      // Disable scrolling since this is just a loading placeholder
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section with avatar and title
            _buildHeaderSection(),

            const SizedBox(height: 24),

            // Featured card
            _buildFeaturedCard(),

            const SizedBox(height: 24),

            // List items
            _buildListItem(),
            const SizedBox(height: 16),
            _buildListItem(),
            const SizedBox(height: 16),
            _buildListItem(),

            const SizedBox(height: 24),

            // Grid items
            _buildGridSection(),
          ],
        ),
      ),
    );
  }

  /// Header with circular avatar and text lines
  Widget _buildHeaderSection() {
    return Row(
      children: [
        const Bone.circle(size: 60),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bone.text(words: 2, fontSize: 16),
              const SizedBox(height: 8),
              Bone.text(words: 1, fontSize: 12),
            ],
          ),
        ),
      ],
    );
  }

  /// Featured card placeholder
  Widget _buildFeaturedCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 12),
        Bone.text(words: 3, fontSize: 16),
        const SizedBox(height: 8),
        Bone.text(words: 10, fontSize: 12),
        const SizedBox(height: 4),
        Bone.text(words: 6, fontSize: 12),
      ],
    );
  }

  /// List item with avatar and text
  Widget _buildListItem() {
    return Row(
      children: [
        const Bone.circle(size: 50),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bone.text(words: 4, fontSize: 14),
              const SizedBox(height: 8),
              Bone.text(words: 2, fontSize: 12),
            ],
          ),
        ),
      ],
    );
  }

  /// Grid section with multiple cards
  Widget _buildGridSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bone.text(words: 2, fontSize: 16),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Bone.text(words: 2, fontSize: 12),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Bone.text(words: 2, fontSize: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
