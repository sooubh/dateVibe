import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.dark
              ? AppTheme.darkGradient
              : AppTheme.lightGradient,
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
                      "Skip for now",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
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

              // Page Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentPage == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? "Get Started"
                          : "Continue",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
