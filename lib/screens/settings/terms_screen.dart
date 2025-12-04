import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [const Color(0xFF4A1C0D), const Color(0xFF1B2F3A)]
                : [const Color(0xFFFFDAB9), const Color(0xFF87CEEB)],
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
                      icon: Icon(Icons.arrow_back_ios_new, color: textColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        "Terms & Privacy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withOpacity(0.2)
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: const ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.srcOver,
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Terms of Service",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Welcome to DateVibe! These terms and conditions outline the rules and regulations for the use of DateVibe's mobile application. By accessing this app, we assume you accept these terms and conditions. Do not continue to use DateVibe if you do not agree to take all of the terms and conditions stated on this page.",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: textColor?.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Your privacy is important to us. It is DateVibe's policy to respect your privacy regarding any information we may collect from you across our app. We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent.\n\nWe also let you know why we’re collecting it and how it will be used. We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: textColor?.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Agreement
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _agreed,
                          onChanged: (value) {
                            setState(() {
                              _agreed = value ?? false;
                            });
                          },
                          activeColor: Theme.of(context).primaryColor,
                          side: BorderSide(
                            color: textColor ?? Colors.black,
                            width: 2,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "I have read and agree to the Terms & Privacy Policy.",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _agreed
                            ? () {
                                Navigator.pop(context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          disabledBackgroundColor: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: _agreed ? 8 : 0,
                          shadowColor: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.3),
                        ),
                        child: const Text(
                          "Agree & Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
}
