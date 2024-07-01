import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.medication_rounded,
              size: 40,
            ),
            title: const Text('Medication'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Illness', style: Theme.of(context).textTheme.bodySmall),
                Text('Frequency', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          ),
        ],
      ),
    );
  }
}
