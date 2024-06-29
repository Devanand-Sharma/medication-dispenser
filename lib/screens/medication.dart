import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({super.key});

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  late EventController _eventController;

  @override
  void initState() {
    super.initState();
    _eventController = EventController();
  }

  String formatDate(DateTime date) {
    return DateFormat('EEEE, MMMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.search),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: CalendarControllerProvider(
        controller: _eventController,
        child: DayView(
          dateStringBuilder: (date, {secondaryDate}) {
            return formatDate(date);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // TODO: Add action when pressing add event button. 
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
