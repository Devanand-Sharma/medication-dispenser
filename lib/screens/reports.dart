import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:medication_app/models/calendar.dart';

import 'package:medication_app/widgets/report_summary.dart';
import 'package:medication_app/widgets/segmented_calendar_button.dart';

class ReportsScreen extends StatefulWidget {
  static const String routeName = '/reports';
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  static const double gap = 10;
  Calendar _parentCalendarView = Calendar.week;

  void _updateCalendarView(Calendar newView) {
    setState(() {
      _parentCalendarView = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text('Reports'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: gap),
            alignment: Alignment.center,
            child: SegmentedCalendarButton(
              onCalendarViewChanged: _updateCalendarView,
            ),
          ),
          const Gap(gap),
          ReportSummary(
            calendarView: _parentCalendarView,
          ),
          const Gap(gap),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap / 2),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                padding: const EdgeInsets.symmetric(vertical: gap / 2),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Item $index'),
                      trailing: const Text('Taken'),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          const Gap(gap / 2),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: gap),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.onPrimary),
                backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary),
              ),
              child: const Text('Export'),
            ),
          ),
          Gap(MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
