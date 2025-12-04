import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _users = [
    {
      "id": "123456",
      "name": "Jessica Thompson",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBsDUtUQ-_mzlz5bIb2bvoaS6MHWtsb5DZyCuX5vzCWNAJlEyiUrNp9y-i2kbFqiPpo1pXB6yIsGV3MTHPiO4nIyXHXWub7X2k4pYgRKxAy1p6z5qt2tqA96KZLtuVJip3AgZmH1wg9FCXUbrq74kYCnI55LTcSBLwfEj1jQFCck7ksPPMl8_crEoJf1nQZjOZxjOSD831wiHFTkGSOxFkBrHeupbR2rzIBf0MnF1OwfnH_i4rhpSCeI-7Eo5LmZ3voiPZBobJHTWY",
      "isBlocked": false,
    },
    {
      "id": "234567",
      "name": "Michael Chen",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDXS86bwT80BLhYFoU-LrcCY18UUX0ymwa2zj6ZAbEWEQrooJ26Mbwbwv5IWZr6CLKaFY0a9ZiS4CK1fLKCjHp38uUZkWzqPgvSJuJng2jBNbLtK5l3tvJhbKDOI4KZH-9GaN6HLwoXy0deXzifS1__TNmOXn8HQB2zsUfnxazzblZcledg4jBJDm3Du8OSQTc06Eupw6Ixx3NybntitQcPuR7ygsiCm2JfbeMtDtJf0qwsugFRfmF_kE5G6lcviMsBit9zGoDEk8Q",
      "isBlocked": true,
    },
    {
      "id": "345678",
      "name": "Alex Rivera",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDf24DSvM5rR0YbCgWIgiwuq3DUsI6COSIKtIvzuuMkkIWtRtcLDc66_525yY5HmQo3PpNgAb54SAC8ZNyglw1P2cLTh4Lu-4y1xOJ0E_-7oS3vSSIszpjceRq-z1AoTwZDbmJoodKgHNAIDURKa7UZZpAVWioN3THt6N8p34pAfXF6Cuq2_2t81o7KPgMqFgHBTB2p0FewsI8nMPUkQVdMsswfpnLFqcvITBXmm4CI4XJDDAQUBH-yes3lFkvL1xvrLCOIKyLScmE",
      "isBlocked": false,
    },
  ];

  void _showAddCoinsDialog(BuildContext context, String userName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Add Coins", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("for $userName"),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Coins added to $userName")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Confirm", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

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
                ? [const Color(0xFF1E293B), const Color(0xFF4A044E)]
                : [const Color(0xFFE0F2FE), const Color(0xFFFFF1F2)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top App Bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.shield, color: textColor, size: 32),
                    Expanded(
                      child: Text(
                        "Admin Panel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 32), // Spacer
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withOpacity(0.4)
                        : Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search users by name or ID",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      hintStyle: TextStyle(color: textColor?.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // User List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    final isBlocked = user["isBlocked"] as bool;

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/admin_user_details',
                          arguments: user,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.black.withOpacity(0.4)
                              : Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(user["image"]),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user["name"],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "User ID: #${user["id"]}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: textColor?.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        user["isBlocked"] = !isBlocked;
                                      });
                                    },
                                    icon: Icon(
                                      isBlocked
                                          ? Icons.check_circle
                                          : Icons.block,
                                      size: 18,
                                      color: isBlocked
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    label: Text(
                                      isBlocked ? "Unblock" : "Block",
                                      style: TextStyle(
                                        color: isBlocked
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isBlocked
                                          ? Colors.green.withOpacity(0.1)
                                          : Colors.red.withOpacity(0.1),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () => _showAddCoinsDialog(
                                      context,
                                      user["name"],
                                    ),
                                    icon: Icon(
                                      Icons.monetization_on,
                                      size: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    label: Text(
                                      "Add Coins",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(
                                        context,
                                      ).primaryColor.withOpacity(0.1),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Reports Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withOpacity(0.4)
                        : Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reports",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "View system analytics and user-generated reports.",
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor?.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            elevation: 4,
                            shadowColor: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "View All Reports",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
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
}
