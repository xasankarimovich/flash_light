import 'package:flutter/material.dart';

import 'ui/screens/toggle_flash_light_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashlightControl(),
    );
  }
}

