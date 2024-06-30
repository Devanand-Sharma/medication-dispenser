import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  static const String routeName = '/notes';
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
