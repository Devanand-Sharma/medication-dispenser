import 'package:flutter/material.dart';

class NewMedicationScreen extends StatefulWidget {
  static const String routeName = '/new-medication';
  const NewMedicationScreen({super.key});

  @override
  NewMedicationScreenState createState() => NewMedicationScreenState();
}

class NewMedicationScreenState extends State<NewMedicationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _medicationName;
  String? _administrationRoute;
  int? _frequency;
  String? _frequencyUnit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Medication'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
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
                onSaved: (value) => _medicationName = value,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Administration Route',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                items: ['Oral', 'Anal', 'Injection']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an administration route';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => _administrationRoute = value),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                      onSaved: (value) => _frequency = int.tryParse(value!),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Frequency Unit',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                      items: ['Hourly', 'Daily', 'Weekly']
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a frequency unit';
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() => _frequencyUnit = value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission here
                    // Using print statements for now to show data format.
                    print('Medication Name: $_medicationName');
                    print('Administration Route: $_administrationRoute');
                    print('Frequency: $_frequency $_frequencyUnit');
                    // If the submission is successful, we'll close the screen
                    // and go back to the medication page showing the added medication (once the DB is implemented).
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save Medication'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}