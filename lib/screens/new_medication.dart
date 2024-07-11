import 'package:flutter/material.dart';

class NewMedicationScreen extends StatelessWidget {
  static const String routeName = '/new-medication';
  const NewMedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Medication'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
