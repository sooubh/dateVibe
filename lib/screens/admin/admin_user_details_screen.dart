import 'package:flutter/material.dart';

class AdminUserDetailsScreen extends StatelessWidget {
  const AdminUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF101622), const Color(0xFF1E293B)]
                : [const Color(0xFFF6F6F8), const Color(0xFFE0F2FE)],
          ),
        ),
        child: SafeArea(
          child: Column(
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
                        "User Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Spacer
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Profile Header
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 128,
                              height: 128,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(user["image"]),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "${user["name"]}, 25",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "User ID: ${user["id"]}",
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor?.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              "Joined: Jan 15, 2024",
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor?.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildActionButton(
                              context,
                              icon: Icons.monetization_on,
                              label: "Add Coins",
                              color: Colors.pink,
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildActionButton(
                              context,
                              icon: Icons.block,
                              label: "Block User",
                              color: Colors.red,
                              isOutlined: true,
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildActionButton(
                              context,
                              icon: Icons.flag,
                              label: "Reports",
                              color: Colors.grey,
                              isOutlined: true,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Bio Section
                      _buildSection(
                        context,
                        title: "Bio",
                        content: Text(
                          "Lover of art, hiking, and deep conversations. Looking for someone to share new experiences with. Let's explore the city's hidden gems together!",
                          style: TextStyle(
                            fontSize: 16,
                            color: textColor?.withOpacity(0.8),
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Interests Section
                      _buildSection(
                        context,
                        title: "Interests",
                        content: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildChip(context, "Hiking", Colors.purple),
                            _buildChip(context, "Art", Colors.pink),
                            _buildChip(context, "Movies", Colors.blue),
                            _buildChip(context, "Photography", Colors.purple),
                            _buildChip(context, "Cooking", Colors.pink),
                            _buildChip(context, "Travel", Colors.blue),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Account Details Section
                      _buildSection(
                        context,
                        title: "Account Details",
                        content: Column(
                          children: [
                            _buildDetailRow(
                              context,
                              "Email Address",
                              "j.doe@example.com",
                            ),
                            const Divider(height: 24),
                            _buildDetailRow(
                              context,
                              "Account Status",
                              "Active",
                              isStatus: true,
                            ),
                            const Divider(height: 24),
                            _buildDetailRow(
                              context,
                              "Coin Balance",
                              "1,250",
                              icon: Icons.monetization_on,
                              iconColor: Colors.amber,
                            ),
                            const Divider(height: 24),
                            _buildDetailRow(
                              context,
                              "Subscription Tier",
                              "Premium Plus",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool isOutlined = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? color.withOpacity(0.1) : color,
        foregroundColor: isOutlined ? color : Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget content,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.withOpacity(0.8),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool isStatus = false,
    IconData? icon,
    Color? iconColor,
  }) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: textColor?.withOpacity(0.6), fontSize: 14),
        ),
        if (isStatus)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Active",
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        else
          Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(icon, size: 16, color: iconColor),
                ),
              Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
