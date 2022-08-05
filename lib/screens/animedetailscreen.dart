import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:movie_streaming/components/categorycard.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnimeDetailScreen extends StatelessWidget {
  var isBookmark = false.obs;
  var _currentTab = 0.obs;

  TextStyle style = GoogleFonts.questrial(fontSize: 14, color: Colors.white);

  AnimeController animeController = Get.find();
  @override
  Widget build(BuildContext context) {
    var trailerUrl = animeController.anime[0].trailerUrl.toString();
    YoutubePlayerController _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(trailerUrl).toString(),
        flags: YoutubePlayerFlags(autoPlay: false));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF333333),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    isBookmark.value = !isBookmark.value;
                    if (isBookmark == true) {
                      Get.showSnackbar(GetSnackBar(
                        duration: Duration(seconds: 1),
                        message: "Added to bookmark",
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      Get.showSnackbar(GetSnackBar(
                        duration: Duration(seconds: 1),
                        message: "Removed from bookmark",
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Icon(Icons.bookmark_add),
                )),
          ],
          centerTitle: true,
          title: Text("Detail"),
          leading: InkWell(
            onTap: () {
              Get.back();
              animeController.anime.clear();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFF333333)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.5,
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(animeController.anime[0].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 185,
                          left: 10,
                          child: Container(
                            width: 95,
                            height: 120,
                            child: Image.network(
                                animeController.anime[0].imageUrl),
                          )),
                      Positioned(
                        top: 240,
                        left: 120,
                        child: Container(
                          width: 280,
                          child: Text(
                            animeController.anime[0].title,
                            style: GoogleFonts.questrial(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 320,
                          left: 20,
                          child: Container(
                            width: 40,
                            height: 58,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 36,
                                  color: Color(0xFF0296E5),
                                ),
                                Text(animeController.anime[0].score.toString(),
                                    style: GoogleFonts.questrial(
                                      fontSize: 16,
                                      color: Color(0xFF0296E5),
                                    )),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 340,
                        left: 80,
                        child: CategoryCard(),
                      )
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height,
                  child: Stack(
                    children: [
                      TabBar(
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.only(left: 10),
                        labelStyle: GoogleFonts.questrial(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        indicatorColor: Color(0xFF3A3F47),
                        onTap: (value) {
                          _currentTab.value = value;
                        },
                        tabs: [
                          Tab(
                            child: Text("About Anime"),
                          ),
                          Tab(
                            child: Text("Reviews"),
                          ),
                          Tab(
                            child: Text("Cast"),
                          ),
                        ],
                      ),
                      // text field
                      Positioned(
                        top: 70,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: (_currentTab == 0)
                              ? Container(
                                  width: 390,
                                  height: Get.height,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Overviews',
                                            style: GoogleFonts.questrial(
                                              fontSize: 12,
                                              color: Colors.white,
                                            )),
                                        Text(
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.questrial(
                                                fontSize: 14,
                                                color: Colors.white),
                                            maxLines: 5,
                                            '${animeController.anime[0].synopsis}'),
                                        SizedBox(height: 10),
                                        // Release date and status
                                        Container(
                                          child: Column(children: [
                                            Row(
                                              children: [
                                                Text('Release Date: ',
                                                    style: style),
                                                SizedBox(
                                                  width: 140,
                                                ),
                                                Text(
                                                  'Status: ',
                                                  style: style,
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 90,
                                                  height: 29,
                                                  child: Text(
                                                      overflow:
                                                          TextOverflow.fade,
                                                      '${animeController.anime[0].aired.from} ',
                                                      style: style),
                                                ),
                                                SizedBox(
                                                  width: 140,
                                                ),
                                                Text(
                                                  '${animeController.anime[0].status}',
                                                  style: style,
                                                )
                                              ],
                                            ),
                                          ]),
                                        ),
                                        SizedBox(height: 10),
                                        // Rated by and Duration
                                        Container(
                                          child: Column(children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 90,
                                                  height: 29,
                                                  child: Text(
                                                      overflow:
                                                          TextOverflow.fade,
                                                      'Rated by: ',
                                                      style: style),
                                                ),
                                                SizedBox(
                                                  width: 140,
                                                ),
                                                Text(
                                                  'Duration: ',
                                                  style: style,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 90,
                                                  height: 29,
                                                  child: Text(
                                                      overflow:
                                                          TextOverflow.fade,
                                                      '${animeController.anime[0].scoredBy} peoples ',
                                                      style: style),
                                                ),
                                                SizedBox(
                                                  width: 140,
                                                ),
                                                Text(
                                                  '${animeController.anime[0].duration}',
                                                  style: style,
                                                )
                                              ],
                                            )
                                          ]),
                                        ),
                                        // Episodes
                                        SizedBox(height: 10),
                                        Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Episode:',
                                                  style: style,
                                                ),
                                                Text(
                                                  '${animeController.anime[0].episodes} episodes',
                                                  style: style,
                                                ),
                                              ]),
                                        ),

                                        //Trailer videos

                                        Container(
                                            child: (trailerUrl == 'null')
                                                ? Text('No trailer available')
                                                : Container(
                                                    width: Get.width,
                                                    height: 450,
                                                    child: YoutubePlayer(
                                                      controller:
                                                          _youtubePlayerController,
                                                      showVideoProgressIndicator:
                                                          true,
                                                      onReady: () {},
                                                    )))
                                      ]),
                                )
                              : (_currentTab == 1)
                                  ? Container(
                                      width: Get.width,
                                      height: Get.height,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ListView.separated(
                                              itemBuilder: (contex, index) {
                                                return Text(
                                                    '${animeController.animeReviews[index].content}');
                                              },
                                              separatorBuilder:
                                                  ((context, index) {
                                                return SizedBox(height: 10);
                                              }),
                                              itemCount: animeController
                                                  .animeReviews.length,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [],
                                    ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
