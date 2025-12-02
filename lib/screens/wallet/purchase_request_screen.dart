import 'package:flutter/material.dart';

class PurchaseRequestScreen extends StatelessWidget {
  const PurchaseRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Coins')),
      body: const Center(child: Text('Coin Purchase Request Screen')),
    );
  }
}
