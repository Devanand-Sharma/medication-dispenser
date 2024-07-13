import 'package:flutter/material.dart';

class ReportList extends StatelessWidget {
  const ReportList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Item $index'),
            trailing: const Text('Taken'),
          ),
        );
      },
    );
  }
}
