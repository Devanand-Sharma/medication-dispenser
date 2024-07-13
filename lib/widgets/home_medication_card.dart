import 'package:flutter/material.dart';

class HomeMedicationCard extends StatelessWidget {
  const HomeMedicationCard({super.key});

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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      // Add your button 1 logic here
                    },
                    child: const Text('Skipped'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      // Add your button 2 logic here
                    },
                    child: const Text('Taken'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
