import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/empty_state_widget.dart';

class NoCoinsScreen extends StatelessWidget {
  const NoCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "DateVibe",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: EmptyStateWidget(
              imageUrl:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCgD2RZewaEuwS3A3QjC3cICmHsJxV6mWMEeuACc4Hnmpsn_9aHJB7ca8oHeFzk-_DKvct-I1DM2a26mffNWMtf9wZMy9yfUYdm_fetw4WhdY9J1M3I2SditAdLOgkls9nKDHYpVwWVOcytruZrxCYHYYck-s4cehG6E3zynVg8mmBx2THdgoOmJQ1oY8rQhImzqXw0d2L-QA3rysyQ4q_nhuooc31erXnSE0OPIXw7Epu8b_Z-YO2saMGGOBlVkNstN7K0ZT3TXhg",
              title: "You’re out of coins!",
              subtitle: "Add coins to keep the vibe going.",
              buttonText: "Add More Coins",
              onButtonPressed: () {
                Navigator.pushNamed(context, '/coin_purchase');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TextButton(
              onPressed: () {
                // Navigate to learn more about coins
              },
              child: Text(
                "Learn more about coins",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
