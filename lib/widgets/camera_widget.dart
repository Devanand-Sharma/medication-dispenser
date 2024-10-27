import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:medication_app/models/scheduled_time.dart';

import 'package:medication_app/models/medication.dart';
import 'package:medication_app/models/medication_route.dart';
import 'package:medication_app/models/medication_frequency.dart';

import 'package:medication_app/screens/medication_form.dart';

class CameraWidget extends StatefulWidget {
  final CameraDescription? camera;
  final String snapDestination;
  const CameraWidget({
    super.key,
    required this.camera,
    required this.snapDestination,
  });

  @override
  State<StatefulWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    if (widget.camera == null) {
      _controller = null;
    } else {
      _controller = CameraController(
        widget.camera!,
        ResolutionPreset.ultraHigh,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller!.initialize();
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  Future<void> capturePicture(BuildContext context) async {
    try {
      await _initializeControllerFuture;
      // final image = await _controller.takePicture();
      // TODO: process image here

      if (context.mounted) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MedicationFormScreen(
              medication: Medication(
                id: 4,
                name: 'Camera Medication',
                condition: 'Medcation App',
                route: MedicationRoute.inhaler,
                dose: 1,
                frequency: MedicationFrequency.onceADay,
                startDate: DateTime(2024, 9, 1, 2, 59),
                endDate: DateTime(2024, 9, 29, 2, 59),
                totalQuantity: 1000,
                remainingQuantity: 500,
                thresholdQuantity: 10,
                isRefillReminder: true,
                scheduledTimes: [
                  ScheduledTime(
                      id: 0,
                      time: const TimeOfDay(hour: 2, minute: 59),
                      medicationId: 0),
                ],
                administeredTimes: [],
                refillDates: [],
              ),
              isEditing: false,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.camera == null) {
      return const NoCameraWidget();
    }
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller!);
            }
            // waiting icon for camera to load
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => capturePicture(context),
          child: Icon(
              color: Theme.of(context).colorScheme.inverseSurface,
              Icons.camera)),
    );
  }
}

class NoCameraWidget extends StatelessWidget {
  const NoCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('NO ACCESSIBLE CAMERA'),
    ));
  }
}
