import 'package:flutter/material.dart';
import 'package:toggle_flash_light/logic/services/platform/flashlight.dart';

class FlashlightControl extends StatefulWidget {
  const FlashlightControl({super.key});

  @override
  State<FlashlightControl> createState() => _FlashlightControlState();
}

class _FlashlightControlState extends State<FlashlightControl> {
  bool _isFlashlightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Flashlight Control'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 60,
            child: const Image(
              image: AssetImage('assets/flash.png'),
            ),
          ),
          Positioned(
            top: 440,
            right: 240,
            child: Switch(
              value: _isFlashlightOn,
              onChanged: (bool value) async {
                _isFlashlightOn = await Flashlight.toggleFlashlight(value);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
