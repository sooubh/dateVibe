import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/matches/match_list_screen.dart';
import 'screens/matches/match_popup_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/profile_setup/profile_details_screen.dart';
import 'screens/profile_setup/profile_bio_screen.dart';
import 'screens/profile_setup/profile_interests_screen.dart';
import 'screens/profile_setup/profile_photos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Uncomment when firebase options are configured
  runApp(const DateVibeApp());
}

class DateVibeApp extends StatelessWidget {
  const DateVibeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DateVibe',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/profile_details': (context) => const ProfileDetailsScreen(),
        '/profile_bio': (context) => const ProfileBioScreen(),
        '/profile_interests': (context) => const ProfileInterestsScreen(),
        '/profile_photos': (context) => const ProfilePhotosScreen(),
        '/home': (context) => const HomeScreen(),
        '/matches': (context) => const MatchListScreen(),
        '/match_popup': (context) => const MatchPopupScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}
