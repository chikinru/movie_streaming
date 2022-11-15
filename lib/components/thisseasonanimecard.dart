import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

import '../screens/animedetailscreen.dart';

class ThisSeasonAnimeCard extends StatelessWidget {
  const ThisSeasonAnimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Container(
      width: Get.width,
      height: 180,
      child: FutureBuilder(
          future: animeController.getThisSeason(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      animeController.anime.clear();
                      animeController.animeChar.clear();
                      animeController.animeID.value = animeController
                          .animeSeason.value[0].anime[index].malId;
                      await animeController
                          .getAninme(animeController.animeID)
                          .then((value) {
                        Get.to(() =>AnimeDetailScreen());
                      });
                    },
                    child: Container(
                      width: 128,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          animeController
                              .animeSeason.value[0].anime[index].imageUrl,
                        ),
                        fit: BoxFit.cover,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 70,
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  animeController
                                      .animeSeason.value[0].anime[index].title,
                                  style: GoogleFonts.questrial(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                // width: 29,
                                // height: 14,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      animeController.animeSeason.value[0]
                                          .anime[index].score
                                          .toString(),
                                      style: GoogleFonts.questrial(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                },
                separatorBuilder: (contex, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                itemCount: animeController.animeSeason.value[0].anime.length,
                scrollDirection: Axis.horizontal,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
