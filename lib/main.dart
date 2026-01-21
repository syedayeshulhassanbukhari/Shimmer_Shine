import 'package:flutter/material.dart';
import 'screens/shimmer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

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

class MyHomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const MyHomePage({super.key, required this.onToggleTheme});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading - show shimmer for 5 seconds then show actual content
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                  const Icon(Icons.check_circle, size: 80, color: Colors.green),
                  const SizedBox(height: 24),
                  Text(
                    'Content Loaded!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showShimmer = true;
                      });
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
