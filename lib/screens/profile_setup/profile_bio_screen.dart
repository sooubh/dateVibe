import 'package:flutter/material.dart';

class ProfileBioScreen extends StatelessWidget {
  const ProfileBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Bio')),
      body: const Center(child: Text('Profile Bio Screen')),
    );
  }
}
