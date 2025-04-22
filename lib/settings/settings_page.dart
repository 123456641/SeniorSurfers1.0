import 'package:flutter/material.dart';
import 'package:senior_surfers/header_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(
        title: 'Settings',
        showBackButton: true, // 👈 enables automatic back button
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SettingTile(
            icon: Icons.person,
            title: 'Profile',
            subtitle: 'Manage your profile information',
            onTap: () {
              // Navigate or show a dialog
            },
          ),
          SettingTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Change app language',
            onTap: () {
              // You can show a modal or go to a language settings page
            },
          ),
          SettingTile(
            icon: Icons.lock,
            title: 'Privacy & Security',
            subtitle: 'Manage your data and permissions',
            onTap: () {
              // Open privacy settings
            },
          ),
          SettingTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Customize notification preferences',
            onTap: () {},
          ),
          SettingTile(
            icon: Icons.help,
            title: 'Help & Support',
            subtitle: 'Get assistance or report an issue',
            onTap: () {},
          ),
          SettingTile(
            icon: Icons.logout,
            title: 'Logout',
            subtitle: 'Sign out of your account',
            onTap: () {
              // Add logout logic
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
