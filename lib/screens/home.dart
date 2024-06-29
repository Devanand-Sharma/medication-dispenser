import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medication_app/widgets/home_medication_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const appBarHeight = 115.0;
  static const appBarSpacing = 5.0;

  // Medical Summary Under App Bar
  Widget _buildSummaryReport(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.primary,
        height: appBarHeight,
        child: Column(
          children: [
            Text(
              DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.now()),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(appBarSpacing),
            Text(
              '4 Medications',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(appBarSpacing),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Log All As Taken'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = List.generate(20, (index) => index);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {},
          )
        ],
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_circle,
              size: 40,
            ),
            Gap(appBarSpacing),
            Text(
              'Harambe',
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.deepPurple.shade100,
        child: Column(children: [
          _buildSummaryReport(context),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              shrinkWrap: true,
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return const HomeMedicationCard();
              },
            ),
          )
        ]),
      ),
    );
  }
}
