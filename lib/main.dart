import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final bool isDarkMode =
      prefs.getBool('isDarkMode') ?? false;

  final String languageCode =
      prefs.getString('languageCode') ?? 'en';

  final bool onboardingCompleted =
      prefs.getBool('onboardingCompleted') ?? false;

  runApp(
    MyApp(
      isDarkMode: isDarkMode,
      languageCode: languageCode,
      onboardingCompleted: onboardingCompleted,
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  final String languageCode;
  final bool onboardingCompleted;

  const MyApp({
    super.key,
    required this.isDarkMode,
    required this.languageCode,
    required this.onboardingCompleted,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;
  late String languageCode;

  @override
  void initState() {
    super.initState();

    isDarkMode = widget.isDarkMode;
    languageCode = widget.languageCode;
  }

  Future<void> changeTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isDarkMode', value);

    setState(() {
      isDarkMode = value;
    });
  }

  Future<void> changeLanguage(String value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('languageCode', value);

    setState(() {
      languageCode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'VOX',

      themeMode:
      isDarkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5CC8E8),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor:
        const Color(0xFF0F0F0F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5CC8E8),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      locale: Locale(languageCode),

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: widget.onboardingCompleted
          ? HomeScreen(
        onThemeChanged: changeTheme,
        onLanguageChanged: changeLanguage,
      )
          : const SplashScreen(),
    );
  }
}