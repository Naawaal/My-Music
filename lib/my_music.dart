import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/consts/color_const.dart';
import 'package:my_music/views/homepage_screen.dart';

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
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: bgDarkColor,
      ),
    );
  }
}
