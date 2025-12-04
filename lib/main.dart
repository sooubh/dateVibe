import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/matches/match_list_screen.dart';
import 'screens/matches/match_popup_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/profile_setup/profile_details_screen.dart';
import 'screens/profile_setup/profile_bio_screen.dart';
import 'screens/profile_setup/profile_interests_screen.dart';
import 'screens/profile_setup/profile_photos_screen.dart';
import 'screens/profile_setup/allow_permissions_screen.dart';
import 'screens/main_scaffold.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/terms_screen.dart';
import 'screens/profile/user_profile_screen.dart';
import 'screens/profile/edit_profile_screen.dart';
import 'screens/notifications/notification_list_screen.dart';
import 'screens/wallet/wallet_screen.dart';
import 'screens/support/contact_support_screen.dart';
import 'screens/status/no_internet_screen.dart';
import 'screens/status/no_matches_widget.dart';
import 'screens/status/no_profiles_widget.dart';
import 'screens/wallet/coin_purchase_screen.dart';
import 'screens/status/no_coins_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/admin/admin_user_details_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: '/splash', // Changed to splash
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/profile_details': (context) => const ProfileDetailsScreen(),
        '/profile_bio': (context) => const ProfileBioScreen(),
        '/profile_interests': (context) => const ProfileInterestsScreen(),
        '/profile_photos': (context) => const ProfilePhotosScreen(),
        '/allow_permissions': (context) => const AllowPermissionsScreen(),
        '/home': (context) => const MainScaffold(),
        '/matches': (context) => const MatchListScreen(),
        '/match_popup': (context) => const MatchPopupScreen(),
        '/chat': (context) => const ChatScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/notifications': (context) => const NotificationListScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/terms': (context) => const TermsScreen(),
        '/contact_support': (context) => const ContactSupportScreen(),
        '/no_internet': (context) => NoInternetScreen(onRetry: () {}),
        '/no_matches': (context) =>
            Scaffold(body: NoMatchesWidget(onStartSwiping: () {})),
        '/no_profiles': (context) =>
            Scaffold(body: NoProfilesWidget(onAdjustFilters: () {})),
        '/coin_purchase': (context) => const CoinPurchaseScreen(),
        '/no_coins': (context) => const NoCoinsScreen(),
        '/splash': (context) => const SplashScreen(),
        '/admin_dashboard': (context) => const AdminDashboardScreen(),
        '/admin_user_details': (context) => const AdminUserDetailsScreen(),
      },
    );
  }
}
