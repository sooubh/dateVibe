import 'package:flutter/material.dart';

class ProfileBioScreen extends StatefulWidget {
  const ProfileBioScreen({super.key});

  @override
  State<ProfileBioScreen> createState() => _ProfileBioScreenState();
}

class _ProfileBioScreenState extends State<ProfileBioScreen> {
  final TextEditingController _bioController = TextEditingController();
  int _characterCount = 0;

  @override
  void initState() {
    super.initState();
    _bioController.addListener(() {
      setState(() {
        _characterCount = _bioController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [const Color(0xFF44222A), const Color(0xFF3A1D30)]
                : [const Color(0xFFFFDAB9), const Color(0xFFFFC0CB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () => Navigator.pop(context),
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    Expanded(
                      child: Text(
                        "Step 2 of 4",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Balance back button
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tell us about yourself...",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),

                      // Bio Input
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Colors.black.withOpacity(0.2)
                                : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _bioController,
                                  maxLines: null,
                                  maxLength: 500,
                                  decoration: InputDecoration(
                                    hintText: "Your bio goes here...",
                                    border: InputBorder.none,
                                    counterText: "",
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color
                                          ?.withOpacity(0.5),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "$_characterCount/500",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color
                                        ?.withOpacity(0.5),
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

              // Next Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile_interests');
                    },
                    child: const Text("Next"),
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
