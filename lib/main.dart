import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  final String languageCode = prefs.getString('languageCode') ?? 'en';

  runApp(
    MyApp(
      isDarkMode: isDarkMode,
      languageCode: languageCode,
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  final String languageCode;

  const MyApp({
    super.key,
    required this.isDarkMode,
    required this.languageCode,
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

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

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
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
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

      home: const SplashScreen(),
    );
  }
}
