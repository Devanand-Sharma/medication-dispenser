import 'package:flutter/material.dart';
import 'package:medication_app/screens/medication_form.dart';

import 'package:medication_app/widgets/new_medication_item.dart';

class NewMedicationModal extends StatelessWidget {
  const NewMedicationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          5, 0, 5, 5 + MediaQuery.of(context).padding.bottom),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewMedicationItem(
              label: 'From Medication Library',
              icon: Icons.medication,
              action: () => Navigator.of(context).pop(),
            ),
            NewMedicationItem(
              label: 'Picture of Prescription Bottle',
              icon: Icons.camera,
              action: () => Navigator.of(context).pop(),
            ),
            NewMedicationItem(
              label: 'Custom Medication',
              icon: Icons.add,
              action: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MedicationFormScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
