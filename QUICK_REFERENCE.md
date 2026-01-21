# Quick Reference Guide - Flutter Shimmer Loading Screen

## 🚀 Quick Start

### 1. Basic Usage (Simplest)
```dart
import 'package:flutter/material.dart';
import 'screens/shimmer_screen.dart';

// Show the default shimmer screen
ShimmerScreen()
```

### 2. With Theme Detection
```dart
final isDark = Theme.of(context).brightness == Brightness.dark;

Stack(
  children: [
    Positioned.fill(
      child: ParticleBackground(isDark: isDark),
    ),
    ShimmerEffect(
      isDark: isDark,
      child: YourContent(),
    ),
  ],
)
```

---

## 📦 Components Reference

### ParticleBackground
Animated falling particles with random movement.

```dart
ParticleBackground(
  isDark: true,              // Required: theme mode
  particleCount: 50,         // Optional: number of particles (default: 50)
)
```

**Properties:**
- `isDark` - Adapts particle colors to theme
- `particleCount` - Number of animated particles

---

### ShimmerEffect
Wraps content with animated shimmer gradient.

```dart
ShimmerEffect(
  isDark: true,              // Required: theme mode
  child: YourWidget(),       // Required: content to shimmer
)
```

**Properties:**
- `isDark` - Adapts shimmer colors to theme
- `child` - Widget to apply shimmer effect

---

### ShimmerCircle
Circular placeholder (avatars).

```dart
ShimmerCircle(size: 60)    // Optional: diameter (default: 60)
```

---

### ShimmerBox
Rectangular placeholder (cards, images).

```dart
ShimmerBox(
  width: 200,
  height: 150,
  borderRadius: BorderRadius.circular(12),  // Optional
)
```

---

### ShimmerLine
Text line placeholder.

```dart
ShimmerLine(
  width: 200,
  height: 12,                // Optional: line height (default: 12)
)
```

---

## 🎨 Color Schemes

### Dark Theme
- Background: `#000000` (Jet Black)
- Shimmer Base: `#1A1A1A` (Dark Grey)
- Shimmer Highlight: `#3A3A3A` (Lighter Grey)
- Particles: White with varying opacity

### Light Theme
- Background: `#FFFFFF` (Pure White)
- Shimmer Base: `#E0E0E0` (Light Grey)
- Shimmer Highlight: `#F5F5F5` (Almost White)
- Particles: Black with varying opacity

---

## ⚙️ Customization

### Adjust Particle Count
```dart
ParticleBackground(
  isDark: isDark,
  particleCount: 75,  // More particles
)
```

### Adjust Shimmer Speed
In `shimmer_effect.dart`:
```dart
duration: const Duration(milliseconds: 1200)  // Faster
duration: const Duration(milliseconds: 2000)  // Slower
```

### Adjust Particle Speed
In `particle_background.dart`:
```dart
speed: _random.nextDouble() * 0.001 + 0.0003  // Faster
speed: _random.nextDouble() * 0.0005 + 0.0001 // Slower
```

---

## 📋 Common Patterns

### Loading Screen with Timeout
```dart
class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? ShimmerScreen() : ActualContent();
  }
}
```

### Custom Shimmer Layout
```dart
ShimmerEffect(
  isDark: isDark,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        ShimmerCircle(size: 80),
        SizedBox(height: 16),
        ShimmerLine(width: 200, height: 16),
        SizedBox(height: 8),
        ShimmerLine(width: 150, height: 14),
      ],
    ),
  ),
)
```

### List Item Shimmer
```dart
Row(
  children: [
    ShimmerCircle(size: 50),
    SizedBox(width: 12),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLine(width: double.infinity, height: 14),
          SizedBox(height: 8),
          ShimmerLine(width: 180, height: 12),
        ],
      ),
    ),
  ],
)
```

### Card Shimmer
```dart
ShimmerBox(
  width: double.infinity,
  height: 200,
  borderRadius: BorderRadius.circular(16),
)
```

---

## 🎯 Performance Tips

1. **Use RepaintBoundary** for particles (already implemented)
2. **Limit particle count** for lower-end devices (30-40 particles)
3. **Avoid deep widget trees** inside shimmer effect
4. **Use const constructors** where possible

---

## 🐛 Troubleshooting

### Shimmer not visible
✅ Check `isDark` matches current theme  
✅ Ensure contrast between background and shimmer colors

### Particles not animating
✅ Verify `SingleTickerProviderStateMixin` is added  
✅ Check animation controller is started

### Performance issues
✅ Reduce `particleCount` (try 30-40)  
✅ Add `RepaintBoundary` around shimmer content  
✅ Simplify shimmer layout structure

---

## 📁 File Structure

```
lib/
├── main.dart                          # Entry point & theme management
├── screens/
│   └── shimmer_screen.dart           # Main shimmer screen
├── widgets/
│   ├── particle_background.dart      # Particle animation
│   └── shimmer_effect.dart           # Shimmer gradient effect
├── utils/
│   └── shimmer_constants.dart        # Configuration constants
└── examples/
    └── shimmer_examples.dart         # 7 example implementations
```

---

## 🔗 Quick Links

- **Main Screen**: `lib/screens/shimmer_screen.dart`
- **Examples**: `lib/examples/shimmer_examples.dart`
- **Constants**: `lib/utils/shimmer_constants.dart`
- **Full Docs**: `SHIMMER_README.md`

---

## 💡 Pro Tips

1. **Theme Switching**: Use `ThemeMode` in MaterialApp for system-wide control
2. **Loading States**: Combine with FutureBuilder or StreamBuilder
3. **Custom Colors**: Edit constants in `shimmer_constants.dart`
4. **Reusability**: Create preset shimmer layouts for common patterns
5. **Accessibility**: Ensure sufficient contrast in both themes

---

## ✨ Example Gallery

See `lib/examples/shimmer_examples.dart` for:
- Basic Shimmer Example
- Custom Loading Card
- Product List Shimmer
- Profile Page Shimmer
- Grid Gallery Shimmer
- Chat Interface Shimmer
- Dashboard Shimmer

---

**Created for production-ready Flutter applications** 🚀
