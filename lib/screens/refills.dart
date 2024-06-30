import 'package:flutter/material.dart';

class RefillsScreen extends StatelessWidget {
  static const String routeName = '/refills';
  const RefillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refills'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
