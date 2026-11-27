import 'package:flutter/material.dart';
import '../app_colors.dart';

class SarthiHeader extends StatelessWidget {
  const SarthiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 15,
          backgroundColor: Color(0xFFF4D4C4),
          child: Icon(
            Icons.show_chart,
            color: AppColors.red,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Sarthi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.red,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF36718A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'EN / नेपाली',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}