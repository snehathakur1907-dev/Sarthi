
import 'package:flutter/material.dart';

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
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4DA),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.route,
                size: 65,
                color: Color(0xFFB85B36),
              ),

              const SizedBox(height: 15),

              const Text(
                'Sarthi (सारथि)',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB85B36),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Your Travel Guide',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'तपाईंको यात्रा साथी',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dot(),
                  const SizedBox(width: 6),
                  _dot(),
                  const SizedBox(width: 6),
                  _dot(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot() {
    return Container(
      height: 6,
      width: 6,
      decoration: const BoxDecoration(
        color: Colors.black87,
        shape: BoxShape.circle,
      ),
    );
  }
}
