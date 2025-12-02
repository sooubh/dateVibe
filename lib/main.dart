import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/profile_setup/profile_details_screen.dart';
import 'screens/profile_setup/profile_photos_screen.dart';
import 'screens/profile_setup/profile_bio_screen.dart';
import 'screens/profile_setup/profile_interests_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/matches/match_list_screen.dart';
import 'screens/matches/match_popup_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/wallet/wallet_screen.dart';
import 'screens/wallet/purchase_request_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/edit_profile_screen.dart';
import 'screens/settings/user_profile_view_screen.dart';
import 'screens/admin/admin_panel_screen.dart';
import 'screens/admin/admin_user_detail_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63), // Pink
          secondary: const Color(0xFF9C27B0), // Purple
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile_details': (context) => const ProfileDetailsScreen(),
        '/profile_photos': (context) => const ProfilePhotosScreen(),
        '/profile_bio': (context) => const ProfileBioScreen(),
        '/profile_interests': (context) => const ProfileInterestsScreen(),
        '/home': (context) => const HomeScreen(),
        '/matches': (context) => const MatchListScreen(),
        '/match_popup': (context) => const MatchPopupScreen(),
        '/chat': (context) => const ChatScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/purchase_request': (context) => const PurchaseRequestScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/user_profile': (context) => const UserProfileViewScreen(),
        '/admin': (context) => const AdminPanelScreen(),
        '/admin_user_detail': (context) => const AdminUserDetailScreen(),
      },
    );
  }
}
