import 'package:flutter/material.dart';
import 'package:my_music/consts/color_const.dart';
import 'package:my_music/consts/text_style.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_outlined, color: whiteColor)),
        centerTitle: true,
        title: Text(
          "My Music",
          style: ourStyle(
            color: whiteColor,
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                "SIRUPATE JUNGAMA",
                style: ourStyle(
                  size: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Babul Giri",
                style: ourStyle(
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: const Icon(
                Icons.music_note_outlined,
                color: whiteColor,
                size: 30,
              ),
              trailing: const Icon(
                Icons.play_arrow_outlined,
                color: whiteColor,
                size: 25,
              ),
            ),
          );
        },
      ),
    );
  }
}
