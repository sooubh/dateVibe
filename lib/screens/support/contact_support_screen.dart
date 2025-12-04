import 'package:flutter/material.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF2A1A1F),
                    const Color(0xFF1A1A2E),
                    const Color(0xFF1A2A2E),
                  ]
                : [
                    const Color(0xFFFFDAB9), // Peach
                    const Color(0xFFE6E6FA), // Lavender
                    const Color(0xFF87CEEB), // Sky Blue
                  ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: textColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        "Contact Support",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Spacer to balance back button
                  ],
                ),
              ),

              // Headline
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                child: Text(
                  "How can we help you?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              // Support Options List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildSupportOption(
                      context,
                      icon: Icons.chat_bubble,
                      iconColor: const Color(0xFFFF69B4), // Hot Pink
                      title: "Chat with Admin",
                      subtitle: "For immediate assistance",
                      onTap: () {
                        // Navigate to admin chat or show placeholder
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Chat with Admin feature coming soon!",
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildSupportOption(
                      context,
                      icon: Icons.mail,
                      iconColor: const Color(0xFF9370DB), // Medium Purple
                      title: "Email Us",
                      subtitle: "Get a response within 24 hours",
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email Us feature coming soon!"),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildSupportOption(
                      context,
                      icon: Icons.description,
                      iconColor: const Color(0xFFFFA07A), // Light Salmon
                      title: "Submit a Query",
                      subtitle: "Fill out our form for detailed issues",
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Submit Query feature coming soon!"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportOption(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1F2687).withOpacity(0.1),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Arrow Icon
            Icon(
              Icons.chevron_right,
              color: isDark ? Colors.grey[400] : Colors.grey[500],
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
