import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:medication_app/providers/medication_provider.dart';
import 'package:medication_app/database_manager/models/dose.dart';
import 'package:medication_app/database_manager/models/dose_schedule.dart';
import 'package:medication_app/database_manager/models/medication.dart';

class MedicationFormScreen extends ConsumerStatefulWidget {
  final Medication? medication;
  const MedicationFormScreen({super.key, this.medication});

  @override
  MedicationFormScreenState createState() => MedicationFormScreenState();
}

class MedicationFormScreenState extends ConsumerState<MedicationFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _medicationData = {
    'name': null,
    'condition': null,
    'count': null,
    'route': null,
    'frequency': null,
    'frequencyUnit': null,
  };

  @override
  void initState() {
    super.initState();
    if (widget.medication != null) {
      _medicationData['name'] = widget.medication!.name;
      _medicationData['condition'] = widget.medication!.condition;
      _medicationData['count'] = widget.medication!.count;
      _medicationData['route'] = widget.medication!.route.label;
      _medicationData['frequency'] = widget.medication!.doseSchedule.frequency;
      _medicationData['frequencyUnit'] =
          widget.medication!.doseSchedule.interval.label;
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newMedication = Medication(
        doseSchedule: DoseSchedule(
          dose: Dose(count: 1, unit: 'pills'),
          frequency: _medicationData['frequency'],
          interval: parseDosageInterval(_medicationData['frequencyUnit']),
        ),
        name: _medicationData['name'],
        condition: _medicationData['condition'],
        count: _medicationData['count'],
        route: parseMedicationRoute(_medicationData['route']),
      );

      if (widget.medication == null) {
        // Add Medication to Hive+Riverpod
        ref.read(medicationProvider.notifier).addMedication(newMedication);
      } else {
        // Update Medication in Hive+Riverpod
        ref.read(medicationProvider.notifier).updateMedication(
              widget.medication!.key,
              newMedication,
            );
      }

      if (!context.mounted) return;
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.medication == null ? 'Add Medication' : 'Update Medication'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                initialValue: _medicationData['name'],
                onSaved: (value) => _medicationData['name'] = value!,
                decoration: const InputDecoration(
                  labelText: 'Medication Name',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a medication name';
                  }
                  return null;
                },
              ),
              const Gap(16),
              TextFormField(
                initialValue: _medicationData['condition'],
                onSaved: (value) => _medicationData['condition'] = value,
                decoration: const InputDecoration(
                  labelText: 'Condition',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a medication condition';
                  }
                  return null;
                },
              ),
              const Gap(16),
              TextFormField(
                initialValue: _medicationData['count'] != null
                    ? _medicationData['count'].toString()
                    : null,
                onSaved: (value) =>
                    _medicationData['count'] = int.tryParse(value!),
                decoration: const InputDecoration(
                  labelText: 'Medication Count',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a medication count';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const Gap(16),
              DropdownButtonFormField<String>(
                value: _medicationData['route'] != null
                    ? _medicationData['route']
                    : null,
                onChanged: (value) =>
                    setState(() => _medicationData['route'] = value),
                decoration: const InputDecoration(
                  labelText: 'Administration Route',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                items: MedicationRoute.values
                    .map((route) => DropdownMenuItem<String>(
                          value: route.label,
                          child: Text(route.label),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an administration route';
                  }
                  return null;
                },
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _medicationData['frequency'] != null
                          ? _medicationData['frequency'].toString()
                          : null,
                      onSaved: (value) => _medicationData['frequency'] =
                          int.tryParse(value!) ?? 0,
                      decoration: const InputDecoration(
                        labelText: 'Frequency',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a frequency';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _medicationData['frequencyUnit'] != null
                          ? _medicationData['frequencyUnit']
                          : null,
                      onChanged: (value) => setState(
                          () => _medicationData['frequencyUnit'] = value),
                      onSaved: (value) =>
                          _medicationData['frequencyUnit'] = value!,
                      decoration: const InputDecoration(
                        labelText: 'Frequency Unit',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      items: DosageInterval.values
                          .map((interval) => DropdownMenuItem<String>(
                                value: interval.label,
                                child: Text(interval.label),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a frequency unit';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Gap(24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  child: Text(widget.medication == null
                      ? 'Add Medication'
                      : 'Update Medication'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
