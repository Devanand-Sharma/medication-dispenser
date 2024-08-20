import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:medication_app/database_manager/models/dose.dart';
import 'package:medication_app/database_manager/models/dose_schedule.dart';
import 'package:medication_app/database_manager/models/medication.dart';

import 'package:medication_app/screens/appointments.dart';
import 'package:medication_app/screens/doctors.dart';
import 'package:medication_app/screens/refills.dart';
import 'package:medication_app/screens/report.dart';
import 'package:medication_app/screens/settings.dart';
import 'package:medication_app/screens/tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  // Register Hive Adapters
  Hive.registerAdapter(MedicationAdapter());
  Hive.registerAdapter(MedicationRouteAdapter());
  Hive.registerAdapter(DoseAdapter());
  Hive.registerAdapter(DosageIntervalAdapter());
  Hive.registerAdapter(DoseScheduleAdapter());

  runApp(const ProviderScope(child: MyApp()));
}

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
        RefillsScreen.routeName: (context) => const RefillsScreen(),
        ReportScreen.routeName: (context) => const ReportScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        TabsScreen.routeName: (context) => const TabsScreen(),
      },
    );
  }
}
