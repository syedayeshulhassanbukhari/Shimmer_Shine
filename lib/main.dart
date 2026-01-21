import 'package:flutter/material.dart';
import 'screens/shimmer_screen.dart';

/// Entry point of the Flutter application
/// Initializes and runs the MyApp widget
void main() {
  runApp(const MyApp());
}

/// Root widget of the application
/// Manages theme mode (light/dark) and provides MaterialApp configuration
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Current theme mode, defaults to system preference
  ThemeMode _themeMode = ThemeMode.system;

  /// Toggles between light and dark theme modes
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shimmer Loading',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,

      // Configure theme settings for light and dark modes

      // Light theme with pure white background
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          background: const Color(0xFFFFFFFF),
        ),
        useMaterial3: true,
      ),

      // Dark theme with jet black background
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          background: const Color(0xFF000000),
        ),
        useMaterial3: true,
      ),

      home: MyHomePage(onToggleTheme: _toggleTheme),
    );
  }
}

/// Home page widget that demonstrates shimmer loading effect
/// Shows shimmer screen initially, then transitions to actual content
class MyHomePage extends StatefulWidget {
  /// Callback function to toggle theme mode
  final VoidCallback onToggleTheme;

  const MyHomePage({super.key, required this.onToggleTheme});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Flag to control shimmer visibility
  /// When true, shows shimmer loading screen; when false, shows actual content
  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();
    // Simulate data loading - show shimmer for 5 seconds then transition to actual content
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showShimmer = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Detect current theme brightness
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Conditionally render shimmer screen or actual content
    return _showShimmer
        ? const ShimmerScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Shimmer Demo'),
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: widget.onToggleTheme,
                  tooltip: 'Toggle Theme',
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success indicator icon
                  const Icon(Icons.check_circle, size: 80, color: Colors.green),
                  const SizedBox(height: 24),
                  // Content loaded message
                  Text(
                    'Content Loaded!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  // Button to restart shimmer loading demo
                  ElevatedButton.icon(
                    onPressed: () {
                      // Reset to shimmer state
                      setState(() {
                        _showShimmer = true;
                      });
                      // Simulate loading delay before showing content again
                      Future.delayed(const Duration(seconds: 5), () {
                        if (mounted) {
                          setState(() {
                            _showShimmer = false;
                          });
                        }
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Show Shimmer Again'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: widget.onToggleTheme,
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              label: Text(isDark ? 'Light Mode' : 'Dark Mode'),
            ),
          );
  }
}
