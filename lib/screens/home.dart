import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:draggable_home/draggable_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListView listView() {
      // TODO: Replace with actual data, home page medications
      return ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          color: Colors.white70,
          child: ListTile(
            leading: CircleAvatar(
              child: Text("$index"),
            ),
            title: const Text("Title"),
            subtitle: const Text("Subtitle"),
          ),
        ),
      );
    }

    // Row headerBottomBarWidget() {
    //   return Row(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.settings,
    //           color: Colors.white,
    //         ),
    //       )
    //     ],
    //   );
    // }

    Widget headerWidget(BuildContext context) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 85,
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    log('Settings Pressed');
                  },
                  child: Text('Settings',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  log('Profile Pressed');
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Harambe',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 85,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    log('Logout Pressed');
                  },
                  child: Text('Logout',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text('Sunday, June 23, 2024',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          const SizedBox(height: 5),
          Text('4 Medications',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              log('Log All as Taken Pressed');
            },
            child: const Text('Log All as Taken'),
          ),
        ],
      );
    }

    return DraggableHome(
      expandedHeight: 170,
      curvedBodyRadius: 5,
      centerTitle: false,
      title: GestureDetector(
        onTap: () {
          log('Profile Pressed');
        },
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            Icons.account_circle,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 50,
          ),
          const SizedBox(width: 8),
          Text('Harambe',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ))
        ]),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ElevatedButton(
            onPressed: () {
              log('Take All Pressed');
            },
            child: const Text('Take All'),
          ),
        ),
      ],
      headerWidget: headerWidget(context),
      body: [
        listView(),
      ],
      fullyStretchable: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBarColor: Theme.of(context).colorScheme.primary,
    );
  }
}
