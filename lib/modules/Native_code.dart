import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeScreenCode extends StatefulWidget {
  @override
  State<NativeScreenCode> createState() => _NativeScreenCodeState();
}

class _NativeScreenCodeState extends State<NativeScreenCode> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'Unknown battery level.';

  Future<void> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(batteryLevel),
          ],
        ),
      ),
    );
  }
}
