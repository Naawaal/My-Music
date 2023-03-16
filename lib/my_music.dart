import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/app/ui/pages/01_homepage/homepage_screen.dart';

class MyMusic extends StatelessWidget {
  const MyMusic({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Music',
      themeMode: ThemeMode.system,
      home: const HomepageScreen(),
      theme: ThemeData(
        fontFamily: '',
      ),
    );
  }
}
