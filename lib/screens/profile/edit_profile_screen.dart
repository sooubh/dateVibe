import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _bioController = TextEditingController(
    text:
        "Lover of dogs, hiking, and finding the best slice of pizza. Looking for someone to join my adventures.",
  );

  final List<String> _photos = [
    "https://lh3.googleusercontent.com/aida-public/AB6AXuDIvrFhYPfmlY_M6SXJZN2Fktu03WOH0SzPFz8u9SprkjL5MXF87XYRLuIJAvEaOHhfd7WjUJLUPoZPUKAl6pdFFcO-CDLHbWT0LQay2jm9r8YmZG-VoWbT_KdLRTAGb71gLK_VHl5a-aWN5PIar-QS_ZFedna5XBfQLIxj45aDFe-cZVNVzuDQi1l9Nq8b_mZaozjBykkbYsUVdeLl9L2CmXCBOB26uwr_HuggJmyxjoC_uEJh_n5LJkS1rYVyS9EJPzidDoZaKqY",
    "https://lh3.googleusercontent.com/aida-public/AB6AXuCOjXGz_6B9-JV5fImAdE1LWjIQRY3-0uJSjFTfHyd_OxnpmKeuNTyvNL4Ixh4ol71MSR80KJkvbM3zqNvIqdk-74huSaauoA3iqPcaqE9llkGs-ykHSPkK8qW-6B4gxPF4IA3DQMuUr7aVUaA_Ym-scoxNwnS0QOA7axdbr5FLb5M3I_rdbgAkHM4qN6Ic4JfIG5E0bj2ZPqNCfnK5V_1RKlZnhPyuwcds_uIflkqKFAP0TaoMOkyt-oC6N4-omag5JW49tN_Dq-k",
    "https://lh3.googleusercontent.com/aida-public/AB6AXuCUWXp5_4P5jCQPPY7Oh1NKdNu8gAGPdEp7ZUPyQtLaJBl2-ZzWA3DX-W0f7g8-RNYZrNuqfGKbyrtjsWcXmqFwaUIkYT8-wYICxytdMWSmAElb6eQecAStBpxHmmuH9DeQs4oLepdlgtJpUJjBtTdb3l5T5uX5xoUTUELBMn1Zp1QV8U8AmYEpRoZUniKQ4ioa0uucmerJgiQF3l9mK6P45EfxFAL5P2vPxQ6bhaiG_lG5jlzXTuJbSdlBBraFBtjKjyVAYPBEUc4",
  ];

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
          "Edit Profile",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Save",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Photos Section
            Text(
              "My Photos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Add at least 2 photos. Hold and drag to reorder.",
              style: TextStyle(
                fontSize: 14,
                color: textColor?.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            _buildPhotoGrid(context),

            const SizedBox(height: 24),

            // About Me Section
            _buildSectionContainer(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    children: [
                      TextField(
                        controller: _bioController,
                        maxLines: 5,
                        maxLength: 300,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.black.withOpacity(0.05),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Tell us a little about yourself...",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // My Basics Section
            _buildSectionContainer(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Basics",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBasicItem(context, "Gender", "Woman"),
                  Divider(color: textColor?.withOpacity(0.1)),
                  _buildBasicItem(context, "Age", "26"),
                ],
              ),
            ),
            const SizedBox(height: 80), // Bottom padding for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }

  Widget _buildPhotoGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 1,
                child: _buildPhotoItem(context, _photos[0], isLarge: true),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: _buildPhotoItem(context, _photos[1]),
                  ),
                  const SizedBox(height: 12),
                  AspectRatio(
                    aspectRatio: 1,
                    child: _buildPhotoItem(context, _photos[2]),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: _buildAddPhotoItem(context),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: _buildAddPhotoItem(context),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: _buildAddPhotoItem(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoItem(
    BuildContext context,
    String url, {
    bool isLarge = false,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(isLarge ? 8 : 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isLarge ? Icons.edit : Icons.close,
              size: isLarge ? 20 : 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotoItem(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.4),
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget _buildSectionContainer(BuildContext context, {required Widget child}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.white.withOpacity(0.2),
        ),
      ),
      child: child,
    );
  }

  Widget _buildBasicItem(BuildContext context, String label, String value) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: textColor)),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor?.withOpacity(0.6),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: textColor?.withOpacity(0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
