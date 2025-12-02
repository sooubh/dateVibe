import 'package:flutter/material.dart';

class UserProfileViewScreen extends StatelessWidget {
  const UserProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: const Center(child: Text('User Profile View Screen')),
    );
  }
}
