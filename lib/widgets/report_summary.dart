import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import 'package:medication_app/models/calendar.dart';

class ReportSummary extends StatefulWidget {
  final Calendar calendarView;
  const ReportSummary({super.key, required this.calendarView});

  @override
  State<ReportSummary> createState() => _ReportSummaryState();
}

class _ReportSummaryState extends State<ReportSummary>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<double> valueNotifier;
  late DateTime startDate;
  final DateTime endDate = DateTime.now();

  @override
  void initState() {
    valueNotifier = ValueNotifier(95);
    startDate = widget.calendarView == Calendar.day
        ? DateTime.now()
        : widget.calendarView == Calendar.week
            ? DateTime.now().subtract(const Duration(days: 7))
            : DateTime.now().subtract(const Duration(days: 30));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReportSummary oldWidget) {
    startDate = widget.calendarView == Calendar.day
        ? endDate
        : widget.calendarView == Calendar.week
            ? DateTime.now().subtract(const Duration(days: 7))
            : DateTime.now().subtract(const Duration(days: 30));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width - 20,
        height: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SimpleCircularProgressBar(
              animationDuration: 2,
              mergeMode: true,
              size: 160,
              valueNotifier: valueNotifier,
              backColor: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
              progressColors: [Theme.of(context).colorScheme.secondary],
              onGetText: (double value) {
                return Text(
                  '${value.toInt()}%',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      '${startDate == endDate ? 'Today,' : DateFormat('MMMM, dd').format(startDate)} ${startDate == endDate ? '' : ' - '} ${DateFormat('MMMM, dd').format(endDate)}',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Gap(10),
                  Text(
                    'Total: 20',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'On Time: 18',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Missed: 1',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Late: 1',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
