import 'package:flutter/material.dart';

class ProfileInterestsScreen extends StatelessWidget {
  const ProfileInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interests')),
      body: const Center(child: Text('Profile Interests Screen')),
    );
  }
}
