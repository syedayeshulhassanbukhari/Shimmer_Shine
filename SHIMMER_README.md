# Flutter Shimmer Loading Screen with Particle Animation

A production-ready shimmer loading screen implementation with animated particle background, supporting both light and dark themes.

## Features

### ✨ Theme Support
- **Automatic theme detection** using `Theme.of(context).brightness`
- **Dark Theme**: Jet Black (#000000) background
- **Light Theme**: Pure White (#FFFFFF) background
- **Dynamic switching** between light and dark modes

### 🎨 Shimmer Effect
- Custom shimmer gradient animation without third-party packages
- Smooth left-to-right shimmer animation
- Theme-aware color schemes:
  - **Dark Mode**: Dark grey (#1A1A1A) base with lighter grey (#3A3A3A) shimmer
  - **Light Mode**: Light grey (#E0E0E0) base with white (#F5F5F5) shimmer
- Multiple placeholder components:
  - `ShimmerCircle` - Circular avatar placeholders
  - `ShimmerBox` - Rectangular card/image placeholders
  - `ShimmerLine` - Text line placeholders

### ✨ Particle Animation
- **50 animated particles** falling from top to bottom
- **Random X-axis movement** using sine wave calculations
- **Highlighted particles** (20% chance):
  - Larger size
  - Higher opacity (0.5-0.9)
  - Subtle glow effect using blur
- **Regular particles**:
  - Smaller size
  - Lower opacity (0.1-0.3)
- Smooth continuous animation at ~60fps

### ⚡ Performance Optimizations
- `RepaintBoundary` for particle canvas
- Independent animation controllers for shimmer and particles
- Efficient `CustomPainter` implementation
- No unnecessary widget rebuilds

## Project Structure

```
lib/
├── main.dart                           # App entry point with theme management
├── screens/
│   └── shimmer_screen.dart             # Main shimmer loading screen
└── widgets/
    ├── particle_background.dart        # Animated particle background
    └── shimmer_effect.dart             # Shimmer gradient effect
```

## Code Architecture

### 1. **ParticleBackground** (`particle_background.dart`)
- Uses `CustomPainter` for efficient rendering
- `SingleTickerProviderStateMixin` for animation
- Manages particle lifecycle and movement
- Implements glow effect for highlighted particles

### 2. **ShimmerEffect** (`shimmer_effect.dart`)
- Custom `ShaderMask` with `LinearGradient`
- Sliding gradient transform for animation
- Reusable placeholder components
- Theme-aware color schemes

### 3. **ShimmerScreen** (`shimmer_screen.dart`)
- Combines particles and shimmer using `Stack`
- Auto-detects theme brightness
- Structured layout with multiple placeholder types
- Modular and reusable design

### 4. **Main App** (`main.dart`)
- Theme management with `ThemeMode`
- Light/Dark theme configurations
- Demonstrates shimmer with 5-second loading simulation
- Theme toggle functionality

## Usage

### Basic Implementation

```dart
import 'package:flutter/material.dart';
import 'screens/shimmer_screen.dart';

// Simply display the shimmer screen
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShimmerScreen(),
    );
  }
}
```

### With Theme Switching

```dart
// The main.dart already includes a complete example with:
// - Automatic theme detection
// - Manual theme toggle button
// - Loading simulation
// - Transition to actual content
```

### Customizing Particle Count

```dart
ParticleBackground(
  isDark: isDark,
  particleCount: 75, // Increase for more particles
)
```

### Using Individual Shimmer Components

```dart
ShimmerEffect(
  isDark: isDark,
  child: Column(
    children: [
      ShimmerCircle(size: 80),
      SizedBox(height: 16),
      ShimmerLine(width: 200, height: 16),
      ShimmerBox(width: 300, height: 150),
    ],
  ),
)
```

## Customization Options

### Adjust Shimmer Speed
In `shimmer_effect.dart`:
```dart
_controller = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 1500), // Change this value
);
```

### Modify Particle Speed
In `particle_background.dart`:
```dart
speed: _random.nextDouble() * 0.0008 + 0.0002, // Adjust multiplier
```

### Change Highlight Probability
```dart
final isHighlighted = _random.nextDouble() < 0.2; // 20% - adjust as needed
```

### Custom Color Schemes
Modify colors in `shimmer_effect.dart`:
```dart
colors: widget.isDark
  ? [
      const Color(0xFF1A1A1A), // Your custom dark base
      const Color(0xFF3A3A3A), // Your custom dark shimmer
      const Color(0xFF1A1A1A),
    ]
  : [
      const Color(0xFFE0E0E0), // Your custom light base
      const Color(0xFFF5F5F5), // Your custom light shimmer
      const Color(0xFFE0E0E0),
    ],
```

## Running the Project

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the app**:
   ```bash
   flutter run
   ```

3. **Toggle theme**:
   - Use the app bar icon or floating action button
   - Watch the shimmer and particles adapt automatically

## Technical Details

### Animation Controllers
- **Shimmer**: 1500ms duration with `Curves.easeInOut`
- **Particles**: 16ms (~60fps) continuous loop

### Memory Management
- Proper disposal of animation controllers
- Efficient particle state management
- Minimal widget rebuilds using `RepaintBoundary`

### Theme Detection
```dart
final isDark = Theme.of(context).brightness == Brightness.dark;
```

## Best Practices Implemented

✅ **Modular Architecture** - Separate widgets for reusability  
✅ **Performance Optimized** - RepaintBoundary and efficient rendering  
✅ **Theme Aware** - Automatic light/dark mode detection  
✅ **Clean Code** - Well-documented and readable  
✅ **No Dependencies** - Custom implementation, no third-party packages  
✅ **Production Ready** - Error-free and tested  

## Future Enhancements

- Add particle color customization
- Implement different particle shapes
- Add shimmer direction options (top-to-bottom, diagonal)
- Create shimmer presets for different content types
- Add pause/resume functionality

## License

This implementation is production-ready and can be used in any Flutter project.

---

**Created with ❤️ for high-end, modern Flutter applications**
