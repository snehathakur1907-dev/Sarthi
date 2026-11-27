import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/sarthi_widgets.dart';

class RegisterScreen extends StatefulWidget {
  final String role;

  const RegisterScreen({super.key, this.role = 'Traveller'});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SarthiPage(
      title: 'Create your account',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registering as ${widget.role}. Enter your details below.',
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 18),
          const Text(
            'Full name',
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          SarthiInput(
            hint: 'Enter your name',
            controller: nameController,
          ),
          const SizedBox(height: 15),
          const Text(
            'Email or mobile number',
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          SarthiInput(
            hint: 'Enter email or mobile',
            controller: emailController,
          ),
          const SizedBox(height: 15),
          const Text(
            'Password',
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          SarthiInput(
            hint: 'Create password',
            obscureText: true,
            controller: passwordController,
          ),
          const Spacer(),
          const SizedBox(height: 20),
          SarthiButton(
            title: 'Use sample details',
            onPressed: () {
              setState(() {
                nameController.text = 'Sarthi User';
                emailController.text = 'user@example.com';
                passwordController.text = 'Sarthi123';
              });
            },
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'Create account',
            onPressed: () {
              if (nameController.text.trim().isEmpty ||
                  emailController.text.trim().isEmpty ||
                  passwordController.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields correctly.'),
                  ),
                );
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'UI completed! Auth backend is not connected yet.',
                  ),
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