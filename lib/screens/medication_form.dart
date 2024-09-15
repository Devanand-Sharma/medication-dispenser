import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'package:medication_app/models/dosage.dart';
import 'package:medication_app/models/medication.dart';
import 'package:medication_app/models/medication_route.dart';
import 'package:medication_app/models/medication_frequency.dart';
import 'package:medication_app/models/prescription.dart';
import 'package:medication_app/providers/medication_provider.dart';
import 'package:medication_app/utils/string.dart';

class MedicationFormScreen extends ConsumerStatefulWidget {
  final Medication? medication;
  final bool isEditing;
  const MedicationFormScreen(
      {super.key, this.medication, this.isEditing = false});

  @override
  MedicationFormScreenState createState() => MedicationFormScreenState();
}

class MedicationFormScreenState extends ConsumerState<MedicationFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _totalQuantityController =
      TextEditingController();
  final TextEditingController _remainingQuantityController =
      TextEditingController();
  bool _remainingQuantityTouched = false;
  bool _isUpdatingTotalQuantity = false;
  final TextEditingController _scheduledTimeController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  final Map<String, dynamic> _medicationData = {
    'name': null,
    'condition': null,
    'medicationRoute': null,
    'dose': null,
    'thresholdQuantity': '10',
    'medicationFrequency': null,
    'medicationFrequencyCount': null,
    'scheduledTime': null,
    'startDate': null,
    'endDate': null,
    'instructions': null,
  };

  @override
  void initState() {
    super.initState();

    _totalQuantityController.addListener(_updateRemainingQuantity);
    _remainingQuantityController.addListener(() {
      if (!_isUpdatingTotalQuantity) {
        _remainingQuantityTouched = true;
      }
    });

    if (widget.medication != null) {
      _medicationData['name'] = widget.medication!.name;
      _medicationData['condition'] = widget.medication!.condition;
      _medicationData['medicationRoute'] = widget.medication!.route;
      _medicationData['dose'] = widget.medication!.dose.toString();
      _medicationData['thresholdQuantity'] =
          widget.medication!.prescription.thresholdQuantity.toString();
      _medicationData['medicationFrequency'] =
          widget.medication!.dosage.frequency;
      _medicationData['medicationFrequencyCount'] =
          widget.medication!.dosage.frequencyCount;
      _medicationData['scheduledTime'] =
          widget.medication!.dosage.scheduledTimes.first;
      _medicationData['startDate'] = widget.medication!.dosage.startDate;
      _medicationData['endDate'] = widget.medication!.dosage.endDate;
      _medicationData['instructions'] = widget.medication!.instructions;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.medication != null) {
      _totalQuantityController.text =
          widget.medication!.prescription.totalQuantity.toString();
      _remainingQuantityController.text =
          widget.medication!.prescription.remainingQuantity.toString();

      _scheduledTimeController.text =
          widget.medication!.dosage.scheduledTimes.first.format(context);

      _startDateController.text =
          DateFormat('dd-MMM-yyyy').format(widget.medication!.dosage.startDate);
      if (widget.medication!.dosage.endDate != null) {
        _endDateController.text = DateFormat('dd-MMM-yyyy')
            .format(widget.medication!.dosage.endDate!);
      }
    }
  }

  @override
  void dispose() {
    _totalQuantityController.dispose();
    _remainingQuantityController.dispose();
    _scheduledTimeController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  void _updateRemainingQuantity() {
    if (!_remainingQuantityTouched) {
      _isUpdatingTotalQuantity = true;
      _remainingQuantityController.text = _totalQuantityController.text;
      _isUpdatingTotalQuantity = false;
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      const uuid = Uuid();

      late Medication upsertedMedcation;

      final newMedication = Medication(
        id: widget.medication == null ? uuid.v4() : widget.medication!.id,
        name: _medicationData['name'],
        condition: _medicationData['condition'],
        route: _medicationData['medicationRoute'],
        dose: int.parse(_medicationData['dose']),
        dosage: Dosage(
          frequency: _medicationData['medicationFrequency'],
          scheduledTimes: [
            _medicationData['scheduledTime'],
          ],
          startDate: _medicationData['startDate'],
          endDate: _medicationData['endDate'],
        ),
        prescription: Prescription(
          totalQuantity: int.parse(_totalQuantityController.text),
          remainingQuantity: int.parse(_remainingQuantityController.text),
          thresholdQuantity: int.parse(_medicationData['thresholdQuantity']),
        ),
      );

      if (!widget.isEditing) {
        // Add Medication to Hive+Riverpod
        ref.read(medicationProvider.notifier).addMedication(newMedication);
        if (!context.mounted) return;
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      } else {
        // Update Medication
        upsertedMedcation = ref.read(medicationProvider).updateMedication(
              newMedication,
            );
        if (!context.mounted) return;
        Navigator.of(context).pop(upsertedMedcation);
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _medicationData['scheduledTime'] = picked;
        _scheduledTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _medicationData['startDate'] = picked;
        _startDateController.text = DateFormat('dd-MMM-yyyy').format(picked);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _medicationData['endDate'] = picked;
        _endDateController.text = DateFormat('dd-MMM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Update Medication' : 'Add Medication'),
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
              DropdownButtonFormField<MedicationRoute>(
                value: _medicationData['medicationRoute'],
                onChanged: (value) {
                  setState(() {
                    _medicationData['medicationRoute'] = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Medication Form',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                items: MedicationRoute.values
                    .map((form) => DropdownMenuItem<MedicationRoute>(
                          value: form,
                          child: Text(toSentenceCase(form.name)),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select an administration route';
                  }
                  return null;
                },
              ),
              const Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _medicationData['dose'],
                      onChanged: (value) => setState(() {
                        _medicationData['dose'] = value;
                      }),
                      onSaved: (value) => _medicationData['dose'] = value,
                      decoration: const InputDecoration(
                        labelText: 'Dose',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a dose';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(medicationRouteToUnit(
                        _medicationData['medicationRoute'])),
                  )
                ],
              ),
              const Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _totalQuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Total Quantity',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a total quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(medicationRouteToUnit(
                        _medicationData['medicationRoute'])),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _remainingQuantityController,
                      onSaved: (value) =>
                          _medicationData['remainingQuantity'] = value,
                      decoration: const InputDecoration(
                        labelText: 'Remaining Quantity',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter remaining quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(medicationRouteToUnit(
                        _medicationData['medicationRoute'])),
                  )
                ],
              ),
              const Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _medicationData['thresholdQuantity'],
                      onSaved: (value) =>
                          _medicationData['thresholdQuantity'] = value,
                      decoration: const InputDecoration(
                        labelText: 'Threshold Quantity',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter remaining quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(medicationRouteToUnit(
                        _medicationData['medicationRoute'])),
                  ),
                ],
              ),
              const Gap(16),
              DropdownButtonFormField<MedicationFrequency>(
                value: _medicationData['medicationFrequency'],
                onChanged: (value) {
                  setState(() {
                    _medicationData['medicationFrequency'] = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Medication Frequency',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                items: MedicationFrequency.values
                    .map((form) => DropdownMenuItem<MedicationFrequency>(
                          value: form,
                          child: Text(toSentenceCase(form.name)),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a medication frequency';
                  }
                  return null;
                },
              ),
              const Gap(16),
              TextFormField(
                controller: _scheduledTimeController,
                readOnly: true,
                onTap: () => _selectTime(context),
                decoration: const InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
                  }
                  return null;
                },
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _startDateController,
                      readOnly: true,
                      onTap: () => _selectStartDate(context),
                      decoration: const InputDecoration(
                        labelText: 'Start Date',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a start date';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      controller: _endDateController,
                      readOnly: true,
                      onTap: () => _selectEndDate(context),
                      decoration: const InputDecoration(
                        labelText: 'End Date',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an end date';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              TextFormField(
                initialValue: _medicationData['instructions'],
                onChanged: (value) => setState(() {
                  _medicationData['instructions'] = value;
                }),
                onSaved: (value) => _medicationData['instructions'] = value,
                decoration: const InputDecoration(
                  labelText: 'Instructions',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
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
                  child: Text(widget.isEditing
                      ? 'Update Medication'
                      : 'Add Medication'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
