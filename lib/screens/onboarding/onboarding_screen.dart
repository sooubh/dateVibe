import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Find your vibe",
      "description": "Connect with people who share your energy and interests.",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBgc_3Jphn_QRGWtEZXtvfU3CRDblc8lNcIgbCRN6SIzDm35RmX0udlcHu-hkTigkIUaUxugJI5bLUXG4qbcRcgWAT_Tdw0YCFjhQoKKiQMXWRBizBZ7XpSlO3qKE9PzDaROMYgfM7epRi7J1cEyZC_UYtYFaik_0ug_9DNOrmg51jBWaALOtlABa0psXt5uuFcknarqhNSG6N-Ahykhc_sqWVqotRHx4lppFpnZCnxJkOkqkfhFlUuYnDAXtYkCEAvABYtp-n1DpY",
    },
    {
      "title": "Meet new people",
      "description": "Discover genuine connections near you.",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuAROeUfH6WZ65jg648gjo742H9wX7z_gCoR_sbJ9bd0UgDu7STZML7qwQdPJB0G6OsJfh506mDdiTaNcfHv5Adg84MY9SOIScsWUCFAhfMAPnfprGTQtXc_WZumMyt1Y5i8pE3DY5ya2KL-yLQyjGMaEwA6qWobNfuPnrF8GwkHi5pWrdm0MEJzbZgt5API1M4T3MvTSTWLEGQmmQFOdGk1VP0QDXZU7bDOhFKN7e6o5dGFFQ_1kePvfcpqzyuOL6pK-M6u4_cdmu0",
    },
    {
      "title": "Swipe. Match. Chat.",
      "description": "Discover genuine connections in three simple steps.",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBgc_3Jphn_QRGWtEZXtvfU3CRDblc8lNcIgbCRN6SIzDm35RmX0udlcHu-hkTigkIUaUxugJI5bLUXG4qbcRcgWAT_Tdw0YCFjhQoKKiQMXWRBizBZ7XpSlO3qKE9PzDaROMYgfM7epRi7J1cEyZC_UYtYFaik_0ug_9DNOrmg51jBWaALOtlABa0psXt5uuFcknarqhNSG6N-Ahykhc_sqWVqotRHx4lppFpnZCnxJkOkqkfhFlUuYnDAXtYkCEAvABYtp-n1DpY", // Reusing first image as placeholder if specific one not found or complex to replicate
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    const Color(0xFF2E1A29),
                    const Color(0xFF1D1A2F),
                    const Color(0xFF301D1A),
                  ]
                : [
                    const Color(0xFFF9E7F4),
                    const Color(0xFFE8E2F6),
                    const Color(0xFFFBE9E5),
                  ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: _finishOnboarding,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Page Indicators (Moved to top as per design)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: 8, // Design shows dots, not bars
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingContent(
                      title: _onboardingData[index]["title"]!,
                      description: _onboardingData[index]["description"]!,
                      imageUrl: _onboardingData[index]["image"]!,
                    );
                  },
                ),
              ),

              // Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: Theme.of(
                        context,
                      ).primaryColor.withOpacity(0.3),
                    ),
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? "Get Started"
                          : "Continue",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
