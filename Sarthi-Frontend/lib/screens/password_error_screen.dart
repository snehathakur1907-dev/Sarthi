import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/sarthi_widgets.dart';

class PasswordErrorScreen extends StatelessWidget {
  const PasswordErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SarthiPage(
      title: 'Try your password again',
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.warning_rounded,
              size: 65,
              color: AppColors.orange,
            ),
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'That password did not match.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          const Spacer(),
          const SizedBox(height: 20),
          SarthiButton(
            title: 'Try again',
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'Ask caregiver for help',
            primary: false,
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}