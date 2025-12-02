import 'package:flutter/material.dart';

class ProfilePhotosScreen extends StatelessWidget {
  const ProfilePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Photos')),
      body: const Center(child: Text('Profile Photos Screen')),
    );
  }
}
