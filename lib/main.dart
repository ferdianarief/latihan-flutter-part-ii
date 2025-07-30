import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'screens/home_page.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(navigatorKey: navigatorKey, home: const HomePage());
  }
}

// check background activity permission
class BatteryHelper {
  static const _channel = MethodChannel('battery_optimization');

  static Future<bool> isIgnoringOptimizations() async {
    try {
      return await _channel.invokeMethod<bool>('isIgnoring') ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> openOptimizationSettings() async {
    await _channel.invokeMethod('openSettings');
  }
}
