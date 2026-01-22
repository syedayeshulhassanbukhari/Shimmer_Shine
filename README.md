# 🌟 Shimmer Shine - Flutter Loading Screen

A **production-ready** shimmer loading screen with animated particle effects, supporting both light and dark themes. Built with pure Flutter for smooth, performant animations without external dependencies.

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-SDK%203.9.2-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen.svg)]()

</div>

## ✨ Features

### 🎨 **Theme Support**
- ✅ Automatic light/dark theme detection
- ✅ Dynamic theme switching with instant updates
- ✅ Customizable color schemes
- ✅ Jet black (#000000) and pure white (#FFFFFF) backgrounds

### 💫 **Shimmer Effect**
- ✅ Smooth left-to-right gradient animation
- ✅ Custom implementation (no third-party dependencies)
- ✅ 1.5-second loop with easing curves
- ✅ Theme-aware color adaptation
- ✅ Multiple placeholder types:
  - `ShimmerCircle` - Avatar placeholders
  - `ShimmerBox` - Card/image placeholders
  - `ShimmerLine` - Text line placeholders

### 🎯 **Particle Animation**
- ✅ 50+ customizable animated particles
- ✅ Random X/Y movement with sine wave oscillation
- ✅ 20% highlighted particles with glow effects
- ✅ 60 FPS smooth animation
- ✅ Optimized `CustomPainter` rendering

### ⚡ **Performance Optimized**
- ✅ `RepaintBoundary` for efficient rendering
- ✅ Independent animation controllers
- ✅ Minimal widget rebuilds
- ✅ Memory-efficient particle management

---

## 🚀 Quick Start

### Prerequisites
- Flutter SDK: ^3.9.2
- Dart SDK: ^3.9.2

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/shimmer-shine.git
   cd shimmer-shine
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'screens/shimmer_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: ShimmerScreen(),
    );
  }
}
```

---

## 📁 Project Structure

```
lib/
├── main.dart                           # App entry point with theme management
├── screens/
│   └── shimmer_screen.dart             # Main shimmer loading screen
├── widgets/
│   ├── particle_background.dart        # Animated particle background
│   └── shimmer_effect.dart             # Shimmer gradient effect
├── utils/
│   └── shimmer_constants.dart          # Configuration constants
└── examples/
    └── shimmer_examples.dart           # 7+ example implementations

test/
└── widget_test.dart                    # Widget tests

android/ & ios/                         # Platform-specific code
```

---

## 🎯 Core Components

### 1. **ShimmerScreen** 
The main widget combining all effects into a cohesive loading screen.

```dart
const ShimmerScreen()
```

- Automatic theme detection
- Combines particles and shimmer layers
- Ready to use out of the box

### 2. **ParticleBackground**
Animated background with falling particles.

```dart
ParticleBackground(
  isDark: true,
  particleCount: 50,
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `isDark` | `bool` | - | Theme mode for particle colors |
| `particleCount` | `int` | 50 | Number of particles to render |

### 3. **ShimmerEffect**
Custom gradient shimmer animation.

```dart
ShimmerEffect(
  isDark: isDark,
  child: Column(
    children: [
      ShimmerCircle(size: 80),
      ShimmerLine(width: 200, height: 16),
      ShimmerBox(width: 300, height: 150),
    ],
  ),
)
```

**Placeholder Components:**
- `ShimmerCircle(size: double)` - Circular elements
- `ShimmerBox(width: double, height: double)` - Rectangular elements
- `ShimmerLine(width: double, height: double)` - Text lines

### 4. **Constants Configuration**
Easily customize animation timings and colors.

```dart
// In shimmer_constants.dart
static const Duration shimmerDuration = Duration(milliseconds: 1500);
static const int particleCount = 50;
static const Color darkBackground = Color(0xFF000000);
static const Color lightBackground = Color(0xFFFFFFFF);
```

---

## 🎨 Customization

### Change Shimmer Speed
```dart
// In shimmer_effect.dart
_controller = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 1200), // Faster
);
```

### Adjust Particle Count
```dart
ParticleBackground(
  isDark: isDark,
  particleCount: 100, // More particles
)
```

### Custom Color Schemes
```dart
// Modify colors in shimmer_effect.dart
colors: widget.isDark
  ? [
      const Color(0xFF1A1A1A), // Dark base
      const Color(0xFF3A3A3A), // Dark shimmer
      const Color(0xFF1A1A1A),
    ]
  : [
      const Color(0xFFE0E0E0), // Light base
      const Color(0xFFF5F5F5), // Light shimmer
      const Color(0xFFE0E0E0),
    ],
```

### Toggle Highlight Probability
```dart
// In particle_background.dart
final isHighlighted = _random.nextDouble() < 0.25; // 25% - adjust as needed
```

---

## 📚 Documentation

This project includes comprehensive documentation:

- **[SHIMMER_README.md](SHIMMER_README.md)** - Complete feature overview and architecture
- **[API_DOCUMENTATION.md](API_DOCUMENTATION.md)** - Detailed API reference for all widgets
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** - Quick start guide and common patterns
- **[VISUAL_STRUCTURE.md](VISUAL_STRUCTURE.md)** - Architecture diagrams and deployment
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Implementation details and status

---

## 🔧 Technical Details

### Animation Architecture
- **Shimmer Controller**: `AnimationController` with 1500ms duration
- **Particle Loop**: 16ms interval (~60fps) for smooth motion
- **Curves**: `Curves.easeInOut` for natural acceleration
- **Rendering**: `CustomPainter` with `RepaintBoundary` optimization

### Theme Detection
```dart
final isDark = Theme.of(context).brightness == Brightness.dark;
```

### Performance Metrics
- **Frame Rate**: 60 FPS smooth animation
- **Memory Usage**: Minimal with efficient particle pooling
- **Widget Rebuilds**: Only when necessary using `RepaintBoundary`
- **Package Size**: Lightweight with minimal dependencies

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  skeletonizer: ^2.1.2  # Optional: for advanced loading states

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

---

## 💡 Usage Examples

### Example 1: Basic Loading Screen
```dart
class MyLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerScreen();
  }
}
```

### Example 2: With Timeout
```dart
Future.delayed(const Duration(seconds: 5), () {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => MyContentScreen()),
  );
});
```

### Example 3: Custom Placeholders
```dart
ShimmerEffect(
  isDark: isDark,
  child: ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ShimmerCircle(size: 60),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                ShimmerLine(width: double.infinity, height: 16),
                SizedBox(height: 8),
                ShimmerLine(width: 200, height: 12),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
)
```

### Example 4: Theme Switching
The app includes built-in theme switching with a floating action button. The shimmer and particle effects automatically adapt to the selected theme.

---

## 🧪 Testing

Run the widget tests:
```bash
flutter test
```

---

## 📊 Platform Support

| Platform | Status | Minimum Version |
|----------|--------|-----------------|
| Android  | ✅     | API 21+         |
| iOS      | ✅     | 12.0+           |
| Web      | ✅     | Modern browsers |
| Windows  | ✅     | 10+             |
| macOS    | ✅     | 10.12+          |
| Linux    | ✅     | Ubuntu 18.04+   |

---

## 🎓 Best Practices

1. **Use `ShimmerScreen` for full-screen loading states**
   - Combines all effects automatically
   - Handles theme detection internally

2. **Customize through constants**
   - Maintain a single source of truth
   - Easy to adjust across the app

3. **Optimize particle count for target devices**
   - Lower count (25-50) for mid-range devices
   - Higher count (75+) for high-end devices

4. **Monitor performance**
   - Use Flutter DevTools to check frame rates
   - Use `RepaintBoundary` for large particle counts

5. **Integrate with actual data loading**
   - Combine with `FutureBuilder` or `StreamBuilder`
   - Transition smoothly to actual content

---

## 🔄 Migration Guide

### From Other Loading Libraries
This implementation is a great alternative to:
- Shimmer package (without dependency)
- Skeleton loaders (with more visual appeal)
- Standard loading indicators (with animations)

Simply replace your existing loader with `ShimmerScreen()`.

---

## 🐛 Troubleshooting

### Particles not moving?
- Check that animation controller is disposed properly
- Verify `SingleTickerProviderStateMixin` is used

### Shimmer not visible?
- Ensure `ShaderMask` is properly layered
- Verify theme colors are contrasting

### Performance issues?
- Reduce `particleCount` parameter
- Check for excessive widget rebuilds using DevTools
- Use `RepaintBoundary` for custom containers

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest improvements
- Submit pull requests
- Improve documentation

---

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

---

## 🙏 Acknowledgments

- Built with [Flutter](https://flutter.dev)
- Inspired by modern loading design patterns
- Special thanks to the Flutter community

---

## 📮 Support

For support, open an issue on [GitHub Issues](https://github.com/yourusername/shimmer-shine/issues) or contact the maintainers.

---

<div align="center">

**⭐ If this project helped you, please consider giving it a star!**

Made with ❤️ by [Your Name]

</div>
