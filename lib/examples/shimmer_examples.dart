import 'package:flutter/material.dart';
import '../widgets/particle_background.dart';
import '../widgets/shimmer_effect.dart';

/// Example implementations showing different ways to use the shimmer loading screen

// ============================================================================
// EXAMPLE 1: Basic Shimmer Screen (Minimal Setup)
// ============================================================================
class BasicShimmerExample extends StatelessWidget {
  const BasicShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          // Add particle background
          Positioned.fill(child: ParticleBackground(isDark: isDark)),

          // Add shimmer content
          ShimmerEffect(
            isDark: isDark,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ShimmerCircle(size: 100),
                  const SizedBox(height: 20),
                  ShimmerLine(width: 200, height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 2: Custom Loading Card
// ============================================================================
class CustomLoadingCard extends StatelessWidget {
  const CustomLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ShimmerEffect(
          isDark: isDark,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const ShimmerCircle(size: 50),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerLine(width: double.infinity, height: 16),
                        const SizedBox(height: 8),
                        ShimmerLine(width: 150, height: 14),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ShimmerBox(
                width: double.infinity,
                height: 200,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: 12),
              ShimmerLine(width: double.infinity, height: 14),
              const SizedBox(height: 8),
              ShimmerLine(width: 250, height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 3: Product List Shimmer
// ============================================================================
class ProductListShimmer extends StatelessWidget {
  const ProductListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Positioned.fill(
            child: ParticleBackground(isDark: isDark, particleCount: 30),
          ),
          ShimmerEffect(
            isDark: isDark,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    ShimmerBox(
                      width: 80,
                      height: 80,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLine(width: double.infinity, height: 16),
                          const SizedBox(height: 8),
                          ShimmerLine(width: 200, height: 14),
                          const SizedBox(height: 8),
                          ShimmerLine(width: 100, height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 4: Profile Page Shimmer
// ============================================================================
class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Positioned.fill(
            child: ParticleBackground(isDark: isDark, particleCount: 40),
          ),
          SafeArea(
            child: ShimmerEffect(
              isDark: isDark,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const ShimmerCircle(size: 120),
                  const SizedBox(height: 16),
                  ShimmerLine(width: 180, height: 20),
                  const SizedBox(height: 8),
                  ShimmerLine(width: 140, height: 16),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        _buildInfoRow(),
                        const SizedBox(height: 16),
                        _buildInfoRow(),
                        const SizedBox(height: 16),
                        _buildInfoRow(),
                        const SizedBox(height: 32),
                        ShimmerBox(
                          width: double.infinity,
                          height: 150,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow() {
    return Row(
      children: [
        const ShimmerCircle(size: 40),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLine(width: double.infinity, height: 14),
              const SizedBox(height: 6),
              ShimmerLine(width: 150, height: 12),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// EXAMPLE 5: Grid Gallery Shimmer
// ============================================================================
class GridGalleryShimmer extends StatelessWidget {
  const GridGalleryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Positioned.fill(
            child: ParticleBackground(isDark: isDark, particleCount: 60),
          ),
          ShimmerEffect(
            isDark: isDark,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ShimmerBox(
                      width: double.infinity,
                      height: double.infinity,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ShimmerLine(width: double.infinity, height: 14),
                  const SizedBox(height: 4),
                  ShimmerLine(width: 80, height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 6: Chat Interface Shimmer
// ============================================================================
class ChatShimmer extends StatelessWidget {
  const ChatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          Positioned.fill(
            child: ParticleBackground(isDark: isDark, particleCount: 25),
          ),
          ShimmerEffect(
            isDark: isDark,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 8,
              itemBuilder: (context, index) {
                final isMe = index % 3 == 0;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isMe) ...[
                        const ShimmerCircle(size: 35),
                        const SizedBox(width: 8),
                      ],
                      ShimmerBox(
                        width: 200,
                        height: 60,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      if (isMe) const SizedBox(width: 8),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 7: Dashboard Shimmer with Mixed Components
// ============================================================================
class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Positioned.fill(
            child: ParticleBackground(isDark: isDark, particleCount: 45),
          ),
          SafeArea(
            child: ShimmerEffect(
              isDark: isDark,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerLine(width: 150, height: 24),
                            const SizedBox(height: 8),
                            ShimmerLine(width: 100, height: 14),
                          ],
                        ),
                        const ShimmerCircle(size: 50),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Stats cards
                    Row(
                      children: [
                        Expanded(
                          child: ShimmerBox(
                            width: double.infinity,
                            height: 100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ShimmerBox(
                            width: double.infinity,
                            height: 100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Featured section
                    ShimmerLine(width: 120, height: 18),
                    const SizedBox(height: 12),
                    ShimmerBox(
                      width: double.infinity,
                      height: 180,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    const SizedBox(height: 24),

                    // List section
                    ShimmerLine(width: 100, height: 16),
                    const SizedBox(height: 12),
                    ...List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            ShimmerBox(
                              width: 60,
                              height: 60,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerLine(
                                    width: double.infinity,
                                    height: 14,
                                  ),
                                  const SizedBox(height: 6),
                                  ShimmerLine(width: 150, height: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
