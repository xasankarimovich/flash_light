import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Flashlight {
  static const platform = MethodChannel('samples.flutter.dev/flashlight');

  static Future<bool> toggleFlashlight(bool isOn) async {
    try {
      final bool result =
          await platform.invokeMethod('toggleFlashlight', {'isOn': isOn});

      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to toggle flashlight: ${e.message}");
      return false;
    }
  }
}
