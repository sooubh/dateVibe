import 'package:flutter/material.dart';

class MatchPopupScreen extends StatelessWidget {
  const MatchPopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('It\'s a Match!')),
      body: const Center(child: Text('Match Popup Screen')),
    );
  }
}
