import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/sarthi_widgets.dart';
import 'password_error_screen.dart';
import 'password_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  final String role;

  const LoginScreen({super.key, this.role = 'Traveller'});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final identifier = emailController.text.trim();
    final password = passwordController.text;

    if (identifier.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your login details')),
      );
      return;
    }

    if (password.length < 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PasswordErrorScreen()),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Signed in as ${widget.role} ($identifier). Connect auth backend next.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SarthiPage(
      title: '${widget.role} sign in',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter your details to continue.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 12),
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
          TextField(
            controller: passwordController,
            obscureText: !showPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() => showPassword = !showPassword);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PasswordScreen()),
                );
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 11,
                ),
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(height: 16),
          SarthiButton(
            title: 'Login to Sarthi',
            onPressed: _handleLogin,
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'Register / Create account',
            primary: false,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RegisterScreen(role: widget.role),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'Back to role selection',
            primary: false,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}