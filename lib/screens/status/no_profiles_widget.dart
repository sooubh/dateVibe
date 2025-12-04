import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/empty_state_widget.dart';

class NoProfilesWidget extends StatelessWidget {
  final VoidCallback onAdjustFilters;

  const NoProfilesWidget({super.key, required this.onAdjustFilters});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBpbmpDKiaygspGQ0lsmqimWePlw7_xuB5K_SgzGpHlatQ8hi1RQgir_-KceA4OVec8Plapsc-79AChZVQnzaV8PGQX6ZHqtx_mp4PHhbPisRV-Ivx7uuDyKJxgrcMiHzCxW3x6IGjEqdcIeupHDXgtnIqv629TzJVuFMm3xkMhFtBs9_VHGKLN3AC2IEHeuL3JFCCWVvXVcCV25SmxYersVAThOEsRutNDz8FZVeUbzvKrW6mxRmWXLdgyXYE_DhKJ6s-rDkNEcG0",
      title: "No new profiles right now",
      subtitle: "Check back later! New people are coming soon.",
      buttonText: "Adjust My Filters",
      onButtonPressed: onAdjustFilters,
    );
  }
}
