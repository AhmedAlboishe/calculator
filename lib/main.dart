import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/theme.dart';

import 'presentation/screens/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.dark,
      home: const HomeScreen(),
    );
  }
}
