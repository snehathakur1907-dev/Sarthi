import 'package:flutter/material.dart';
import 'package:sarthi/screens/splash_screen.dart';
import 'app_colors.dart';

void main() {
  runApp(const SarthiApp());
}

class SarthiApp extends StatelessWidget {
  const SarthiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sarthi',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.orange,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}