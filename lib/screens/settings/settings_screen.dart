import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/confirmation_dialog.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "Leaving so soon?",
        message: "Are you sure you want to log out?",
        confirmText: "Log Out",
        onConfirm: () {
          Navigator.pop(context); // Close dialog
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          );
        },
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "Delete Account",
        message:
            "Are you sure you want to delete your account? This action cannot be undone.",
        confirmText: "Delete",
        isDestructive: true,
        onConfirm: () {
          Navigator.pop(context); // Close dialog
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/onboarding',
            (route) => false,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.backgroundDark
          : AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader(context, "Account"),
          _buildListTile(
            context,
            icon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () => Navigator.pushNamed(context, '/edit_profile'),
          ),
          _buildListTile(
            context,
            icon: Icons.notifications_outlined,
            title: "Notifications",
            onTap: () => Navigator.pushNamed(context, '/notifications'),
          ),
          _buildListTile(
            context,
            icon: Icons.security,
            title: "Privacy & Security",
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, "App"),
          _buildListTile(
            context,
            icon: Icons.language,
            title: "Language",
            trailing: "English",
            onTap: () {},
          ),
          _buildListTile(
            context,
            icon: Icons.dark_mode_outlined,
            title: "Dark Mode",
            trailingSwitch: true,
            value: isDark,
            onChanged: (val) {}, // Todo: Implement theme switching
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, "Support"),
          _buildListTile(
            context,
            icon: Icons.help_outline,
            title: "Help Center",
            onTap: () {},
          ),
          _buildListTile(
            context,
            icon: Icons.support_agent,
            title: "Contact Support",
            onTap: () => Navigator.pushNamed(context, '/contact_support'),
          ),
          _buildListTile(
            context,
            icon: Icons.description_outlined,
            title: "Terms & Privacy",
            onTap: () => Navigator.pushNamed(context, '/terms'),
          ),
          const SizedBox(height: 24),
          _buildListTile(
            context,
            icon: Icons.logout,
            title: "Log Out",
            isDestructive: true,
            onTap: () => _showLogoutDialog(context),
          ),
          _buildListTile(
            context,
            icon: Icons.delete_outline,
            title: "Delete Account",
            isDestructive: true,
            onTap: () => _showDeleteAccountDialog(context),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                color: textColor?.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? trailing,
    bool trailingSwitch = false,
    bool value = false,
    ValueChanged<bool>? onChanged,
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final color = isDestructive ? Colors.red : textColor;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withOpacity(0.1)
              : (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.05)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      trailing: trailingSwitch
          ? Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Theme.of(context).primaryColor,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailing != null)
                  Text(
                    trailing,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor?.withOpacity(0.6),
                    ),
                  ),
                if (trailing != null) const SizedBox(width: 8),
                if (!isDestructive && !trailingSwitch)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: textColor?.withOpacity(0.3),
                  ),
              ],
            ),
      onTap: onTap,
    );
  }
}
