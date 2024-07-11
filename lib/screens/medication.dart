import 'package:flutter/material.dart';

import 'package:medication_app/widgets/medication_card.dart';
import 'package:medication_app/widgets/new_medication_modal.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({super.key});

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  void _createNewMedication(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: false,
      isDismissible: true,
      enableDrag: true,
      showDragHandle: true,
      builder: (bCtx) => const SingleChildScrollView(
        child: NewMedicationModal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer()),
        title: const Text('Medications'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        color: Colors.deepPurple.shade100,
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const MedicationCard();
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewMedication(context),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
