import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/empty_state_widget.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF3A202A), const Color(0xFF221019)]
                : [
                    const Color(0xFFFFDAB9),
                    const Color(0xFFFFC4D6),
                    const Color(0xFFE6E6FA),
                  ],
          ),
        ),
        child: EmptyStateWidget(
          imageUrl:
              "https://lh3.googleusercontent.com/aida-public/AB6AXuCQ1d5RgO4Syv8ELxmFXiSSv0EE_snqCb7273oW10JGMdh2dqi7M-gy1qw-5_uq189cAr0wlixn6EQY6n27AJNdcL8rmBBhFa362O6TMsGsL1bZKVPeIdR4Cr10oY4CnOPIvChxp3rGXQPq_XiF8MnYK-Dl5Jcfy8tuFWwIU-_3axV6lEkitmo_16xr63JGEGzHtojm91HUK1Rq40qwpOGwVcKob0-TPxKH9oTwc-1Cx84P4jXBq52sDkyHwMY0Td6zr8X6iJrpPAY",
          title: "No Internet Connection",
          subtitle:
              "We can't seem to connect to the DateVibe network. Please check your connection.",
          buttonText: "Retry",
          onButtonPressed: onRetry,
        ),
      ),
    );
  }
}
