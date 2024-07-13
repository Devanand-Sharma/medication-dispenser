import 'package:flutter/material.dart';

import 'package:medication_app/screens/appointments.dart';
import 'package:medication_app/screens/doctors.dart';
import 'package:medication_app/screens/new_medication.dart';
import 'package:medication_app/screens/notes.dart';
import 'package:medication_app/screens/refills.dart';
import 'package:medication_app/screens/reports.dart';
import 'package:medication_app/screens/settings.dart';
import 'package:medication_app/screens/tabs.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(secondary: Colors.amberAccent),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          titleLarge: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          headlineSmall:
              TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          headlineMedium:
              TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        AppointmentsScreen.routeName: (context) => const AppointmentsScreen(),
        DoctorsScreen.routeName: (context) => const DoctorsScreen(),
        NewMedicationScreen.routeName: (context) => const NewMedicationScreen(),
        NotesScreen.routeName: (context) => const NotesScreen(),
        RefillsScreen.routeName: (context) => const RefillsScreen(),
        ReportsScreen.routeName: (context) => const ReportsScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        TabsScreen.routeName: (context) => const TabsScreen(),
      },
    );
  }
}
