import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground/infra_list_pager_builder.dart';
import 'package:playground/ui/component/main.dart';

// Define background colors for light and dark themes
const _colorBackgroundLight = 0xFFF5F5F5;
const _colorBackgroundDart = 0xFF212121;

void main() {
  // Ensure the Flutter binding is initialized before calling platform-specific code.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

List<PagerBuilder> get _builders => [
  PagerBuilder(title: 'UI', builder: (context) => componentPager(context)),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the light theme style
    const lightSystemUiStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Status bar is transparent
      statusBarIconBrightness: Brightness.dark,
      // Status bar icons are dark
      systemNavigationBarColor: Color(_colorBackgroundLight),
      // A light navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.dark, // Navigation bar icons are dark
    );

    // Define the dark theme style
    const darkSystemUiStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Status bar is transparent
      statusBarIconBrightness: Brightness.light,
      // Status bar icons are light
      systemNavigationBarColor: Color(_colorBackgroundDart),
      // A dark navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // Navigation bar icons are light
    );

    return MaterialApp(
      title: 'Flutter Learning Journey',

      // --- THEME CONFIGURATION ---
      themeMode: ThemeMode.system,
      // This is what makes it follow the system

      // --- LIGHT THEME ---
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          // Apply the light style to all AppBars in the light theme
          systemOverlayStyle: lightSystemUiStyle,
          backgroundColor: Colors.amber,
        ),
        scaffoldBackgroundColor: const Color(_colorBackgroundLight),
      ),

      // --- DARK THEME ---
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          // Apply the dark style to all AppBars in the dark theme
          systemOverlayStyle: darkSystemUiStyle,
          backgroundColor: Colors.indigo,
        ),
        scaffoldBackgroundColor: const Color(_colorBackgroundDart),
      ),

      home: createPagerList('Flutter Playground', context, _builders),
    );
  }
}
