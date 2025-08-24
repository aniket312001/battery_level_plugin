
import 'package:flutter_battery_meter/flutter_battery_meter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? version;
  int? battery;

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  Future<void> _loadInfo() async {
    version = await BatteryLevel().getPlatformVersion();
    battery = await BatteryLevel().getBatteryLevel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Battery Plugin Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Platform: $version'),
              Text('Battery: ${battery ?? "unknown"}%'),
            ],
          ),
        ),
      ),
    );
  }
}
