import 'package:flutter/material.dart';
import '../widgets/sarthi_widgets.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SarthiPage(
      title: 'Enter your password',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Use the sample account to continue.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 20),
          SarthiInput(
            hint: 'Enter password',
            obscureText: true,
            controller: passwordController,
          ),
          const Spacer(),
          const SizedBox(height: 20),
          SarthiButton(
            title: 'Continue with password',
            onPressed: () {
              if (passwordController.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password must be at least 6 characters'),
                  ),
                );
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password accepted. Ready for auth integration.'),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'Forgot password?',
            primary: false,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password reset will be connected later.'),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'Back',
            primary: false,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}