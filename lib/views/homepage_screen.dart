import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/consts/color_const.dart';
import 'package:my_music/consts/text_style.dart';
import 'package:my_music/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.put(PlayerController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgDarkColor,
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
      body: FutureBuilder<List<SongModel>>(
        future: playerController.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No song found !",
                style: ourStyle(
                  color: whiteColor,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: ListTile(
                      onTap: () {
                        playerController.playSong(
                          index: index,
                          uri: snapshot.data![index].uri,
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: bgColor,
                      title: Text(
                        snapshot.data![index].displayNameWOExt,
                        style: ourStyle(
                          size: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data![index].artist}",
                        style: ourStyle(
                          size: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: QueryArtworkWidget(
                        id: snapshot.data![index].id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(
                          Icons.music_note_outlined,
                          size: 30,
                          color: whiteColor,
                        ),
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
        },
      ),
    );
  }
}
