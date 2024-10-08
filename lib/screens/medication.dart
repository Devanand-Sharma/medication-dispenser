import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_app/providers/medication_provider.dart';

import 'package:medication_app/widgets/medication_card.dart';
import 'package:medication_app/widgets/new_medication_modal.dart';

class MedicationScreen extends ConsumerWidget {
  const MedicationScreen({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final medications = ref.watch(medicationProvider).medications;

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
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              shrinkWrap: true,
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return MedicationCard(medication);
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
