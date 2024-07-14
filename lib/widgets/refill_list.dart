import 'package:flutter/material.dart';

class RefillList extends StatelessWidget {
  const RefillList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: const Text('Medication'),
          subtitle: const Text('Date'),
          leading: const Icon(Icons.medication),
          trailing: Text(
            'x20',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
      itemCount: 10,
    );
  }
}
