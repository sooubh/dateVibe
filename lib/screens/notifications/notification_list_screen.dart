import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

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
          "Notifications",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader(context, "Today"),
          const SizedBox(height: 12),
          _buildNotificationItem(
            context,
            image:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuA0y0cY83hs4vJahlQcqq5nEDh20lqo7zWwvX5yBD_3X4qSPowCkjg8xKo-XENlFhHlyK5R5tbJAetZpJMTaKA3f3v51fVuv7oJBDUjxW1QbF8Tw6r_aG2ooXeZx1hnCCLUHhEHThwITAsGJIPCkcOw4cUIQNQOhi8SPJXSnKzpGgK4elyRqhiPg1v_hRg1zcbxiwq4_UPWuybw3kq6NYqNLN0_H0oCEVxl9ulqrL_rLMQH_6cqgdedYEHUS0o-68lbcSCoQdnuLx8",
            text: "You and Amelia matched!",
            time: "5m ago",
            isUnread: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            context,
            image:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBLqXVzoeU_qEr_ixsukBVR578Y4Z299Pd2jPBe-x4WdnptOepCuXuyr764us7EmlmZ2Zp04KYt0p_Ee1_0wUMhzx0Za9kuDYU8LNrsixnDJoE4T6BqmcMpKufqI3Kdb9K6GwJD96ab8O7I93sxrsErGRtqLgdTviXsLHfsuOOHsOb66xFTdrgjWh0qb80jYHjJyBRwwWDF3-3U89JPOWzqzIDf2s93QX1lJqKAqHvt06g9noTXD03Z5jGD2BtuXFMnWyZLdCuzsOs",
            text: "Leo sent you a message.",
            time: "2h ago",
            isUnread: true,
          ),
          const SizedBox(height: 12),
          _buildSystemNotificationItem(
            context,
            icon: Icons.monetization_on,
            text: "Your coin balance has been updated.",
            time: "4h ago",
            highlight: "+100 coins",
          ),

          const SizedBox(height: 24),
          _buildSectionHeader(context, "Yesterday"),
          const SizedBox(height: 12),
          _buildNotificationItem(
            context,
            image:
                "https://lh3.googleusercontent.com/aida-public/AB6AXuDlEvvHxqN4HkNE0Znc6fRKh_kDGtGcOnaR6Iaj7X0P1jMw6E6ABzH0artdljWTQLx9G8Hp4uPBHmO47Csht9hgwApVk3LS3ayyeXogWtSGAlhCbsBj1arzgKvVNwqv9QiV9NNv_OZsnV1TN6f8dxtJZtvl4FkZ8uc1ExWGS_UEfPuVubiJM_eKUi9WVv2Ebi8jNi6gZrkRLdbfLZuywladBZDG-GhHLiumgqRJSuHhypirhggOF0fyfjY9Vspb6cHss9JeZF0fWC8",
            text: "You and Chloe matched!",
            time: "1d ago",
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.5),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required String image,
    required String text,
    required String time,
    required bool isUnread,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(image)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFF83C5BE), // Teal color from design
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSystemNotificationItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required String time,
    required String highlight,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(
                0xFFE5989B,
              ).withOpacity(0.3), // Pink from design
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFE5989B)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Text(
            highlight,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFE5989B),
            ),
          ),
        ],
      ),
    );
  }
}
