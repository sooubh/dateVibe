import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/empty_state_widget.dart';

class NoMatchesWidget extends StatelessWidget {
  final VoidCallback onStartSwiping;

  const NoMatchesWidget({super.key, required this.onStartSwiping});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuD0pPopF4Gcm9E9naP8wRYJC16ch5RiN-Ajyfiie_tjbrWlOCk9_BLuXf_u-n6HgypW5FBvVAwI_cwJraXJr6mKyB_HyWNoidmKUfInI7H472x79fekYFzbcdZS8I6VIAp_3hP2P0h28Uo1Ks3BkgKVWwKW6DrLnEe-gUUJWlSJf1LVO5VF7HhtvgD_dQuGbgYZ75P8sMR_zqGIpAxbn425zps3dbgNDuYy4i1oB9LRdroO1S5O6oZqFfNHkundBlVPJg9wSlQmbmI",
      title: "No Matches Yet",
      subtitle: "Keep swiping to find your vibe!",
      buttonText: "Start Swiping ❤️",
      onButtonPressed: onStartSwiping,
    );
  }
}
