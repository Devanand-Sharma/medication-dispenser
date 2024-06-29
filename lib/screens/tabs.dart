import 'package:flutter/material.dart';

import 'package:medication_app/screens/history.dart';
import 'package:medication_app/screens/home.dart';
import 'package:medication_app/screens/medication.dart';
import 'package:medication_app/widgets/more_drawer.dart';

const List<Map<String, dynamic>> pages = [
  {
    'page': HomeScreen(),
    'title': 'Home',
  },
  {
    'page': MedicationScreen(),
    'title': 'Medication',
  },
  {
    'page': HistoryScreen(),
    'title': 'History',
  },
];

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => __TabsScreenState();
}

class __TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = pages;
  }

  // ? Might not need this, since parent widget is stateless
  @override
  void didUpdateWidget(TabsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pages = pages;
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoreDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.home),
            label: _pages[0]['title'] as String,
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.medication_rounded),
            label: _pages[1]['title'] as String,
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.calendar_month_rounded),
            label: _pages[2]['title'] as String,
          ),
        ],
      ),
    );
  }
}
