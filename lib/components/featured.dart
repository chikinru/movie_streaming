import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/animecontroller.dart';
import '../screens/animedetailscreen.dart';

class Featured extends StatelessWidget {
  Featured({Key? key}) : super(key: key);
  var _currentCarousel = 0.obs;
  var _malID = 0.obs;
  var _currentGenre = 0.obs;
  var _changeGenre = false.obs;
  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Obx(() => Container(
                height: Get.height * 0.4,
                width: Get.width,
                child: (_currentGenre == 0)
                    ? CarouselSlider(
                        items: [
                          for (var i = 0;
                              i < animeController.topAnime.value.length;
                              i++)
                            Container(
                              width: Get.width,
                              height: 630,
                              child: Image.network(
                                animeController.topAnime.value[i].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                        options: CarouselOptions(
                          height: Get.height,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 20),
                          onPageChanged: (index, reason) {
                            _currentCarousel.value = index;
                            _malID.value =
                                animeController.topAnime.value[index].malId;
                            print(_malID);
                          },
                          enlargeCenterPage: true,
                        ),
                      )
                    : (_currentGenre == 1)
                        ? CarouselSlider(
                            items: [
                              for (var i = 0;
                                  i < animeController.actionAnime.length;
                                  i++)
                                Container(
                                  width: Get.width,
                                  height: 630,
                                  child: Image.network(
                                    animeController.actionAnime[i].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ],
                            options: CarouselOptions(
                              height: Get.height,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 20),
                              onPageChanged: (index, reason) {
                                _currentCarousel.value = index;
                                _malID.value =
                                    animeController.actionAnime[index].malId;
                              },
                              enlargeCenterPage: true,
                            ),
                          )
                        : (_currentGenre == 2)
                            ? CarouselSlider(
                                items: [
                                  for (var i = 0;
                                      i < animeController.romanceAnime.length;
                                      i++)
                                    Container(
                                      width: Get.width,
                                      height: 630,
                                      child: Image.network(
                                        animeController
                                            .romanceAnime[i].imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                                options: CarouselOptions(
                                  height: Get.height,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 20),
                                  onPageChanged: (index, reason) {
                                    _currentCarousel.value = index;
                                    _malID.value = animeController
                                        .romanceAnime[index].malId;
                                  },
                                  enlargeCenterPage: true,
                                ),
                              )
                            : (_currentGenre == 3)
                                ? CarouselSlider(
                                    items: [
                                      for (var i = 0;
                                          i <
                                              animeController
                                                  .survivalAnime.length;
                                          i++)
                                        Container(
                                          width: Get.width,
                                          height: 630,
                                          child: Image.network(
                                            animeController
                                                .survivalAnime[i].imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    ],
                                    options: CarouselOptions(
                                      height: Get.height,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 20),
                                      onPageChanged: (index, reason) {
                                        _currentCarousel.value = index;
                                        _malID.value = animeController
                                            .survivalAnime[index].malId;
                                      },
                                      enlargeCenterPage: true,
                                    ),
                                  )
                                : CarouselSlider(
                                    items: [
                                      for (var i = 0;
                                          i <
                                              animeController
                                                  .horrorAnime.length;
                                          i++)
                                        Container(
                                          width: Get.width,
                                          height: 630,
                                          child: Image.network(
                                            animeController
                                                .horrorAnime[i].imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    ],
                                    options: CarouselOptions(
                                      height: Get.height,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 20),
                                      onPageChanged: (index, reason) {
                                        _currentCarousel.value = index;
                                        _malID.value = animeController
                                            .horrorAnime[index].malId;
                                      },
                                      enlargeCenterPage: true,
                                    ),
                                  ))),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              width: Get.width * 0.9,
              height: 67,
              decoration: BoxDecoration(
                  color: Color(0xFF42423F).withOpacity(0.5),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: TabBar(
                onTap: (value) {
                  _currentGenre.value = value;
                  _changeGenre.value = true;
                  animeController.getAnimeByGenre(_currentGenre.value);
                },
                labelStyle: GoogleFonts.questrial(
                  color: Colors.white,
                  fontSize: 14,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 4.0,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Action",
                  ),
                  Tab(
                    text: "Romance",
                  ),
                  Tab(
                    text: "Survival",
                  ),
                  Tab(
                    text: "Horror",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 210,
              child: Container(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF333333)),
                        onPressed: () {},
                        child: Text(' + Wishlist')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF2C94C),
                        ),
                        onPressed: () async {
                          animeController.animeID.value = _malID.value;
                          await animeController
                              .getAninme(animeController.animeID)
                              .then((value) {
                            Get.to(AnimeDetailScreen());
                          });
                        },
                        child: Text('Details')),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
