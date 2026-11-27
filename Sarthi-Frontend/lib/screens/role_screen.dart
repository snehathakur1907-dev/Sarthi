import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/sarthi_widgets.dart';
import 'login_screen.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  String selectedRole = 'Traveller';

  void _openLoginWithRole(String role) {
    setState(() => selectedRole = role);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(role: role),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SarthiPage(
      title: 'Who are you?',
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _roleCard(
                  icon: Icons.person_outline,
                  title: 'Traveller',
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _roleCard(
                  icon: Icons.accessible,
                  title: 'Caretaker',
                ),
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(height: 20),
          SarthiButton(
            title: 'I am travelling',
            onPressed: () => _openLoginWithRole('Traveller'),
          ),
          const SizedBox(height: 10),
          SarthiButton(
            title: 'I am a caretaker',
            primary: false,
            onPressed: () => _openLoginWithRole('Caretaker'),
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

  Widget _roleCard({
    required IconData icon,
    required String title,
  }) {
    final isSelected = selectedRole == title;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => setState(() => selectedRole = title),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.red : Colors.grey.shade400,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: AppColors.red),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}