import 'package:flutter/material.dart';

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
            .copyWith(secondary: Colors.amberAccent, onPrimary: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => const TabsScreen(),
      },
    );
  }
}
