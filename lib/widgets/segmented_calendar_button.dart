import 'package:flutter/material.dart';

import 'package:medication_app/models/calendar.dart';

class SegmentedCalendarButton extends StatefulWidget {
  final void Function(Calendar) onCalendarViewChanged;
  const SegmentedCalendarButton({
    super.key,
    required this.onCalendarViewChanged,
  });

  @override
  State<SegmentedCalendarButton> createState() =>
      _SegmentedCalendarButtonState();
}

class _SegmentedCalendarButtonState extends State<SegmentedCalendarButton> {
  Calendar calendarView = Calendar.week;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      style: SegmentedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        selectedForegroundColor: Theme.of(context).colorScheme.secondary,
        selectedBackgroundColor: Theme.of(context).colorScheme.primary,
      ),
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
          widget.onCalendarViewChanged(newSelection.first);
        });
      },
    );
  }
}
