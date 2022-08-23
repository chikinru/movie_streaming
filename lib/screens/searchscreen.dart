import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

import 'animedetailscreen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  var onSubmit = false.obs;
  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: Get.width * 0.85,
            child: TextField(
              onChanged: (value) {
                animeController.animeList.clear();
                onSubmit.value = false;
              },
              onSubmitted: (value) {
                onSubmit.value = true;
              },
              style: TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    onSubmit.value = false;
                    searchController.text = "";
                  },
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {
                    animeController.animeList.clear();
                  },
                ),
              ),
            ),
          ),
          Obx(() => Expanded(
              child: (onSubmit == true)
                  ? FutureBuilder(
                      future:
                          animeController.getAllAnime(searchController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.separated(
                            itemCount: animeController.animeList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  animeController.animeID.value =
                                      animeController.animeList[index].malId!;
                                  await animeController
                                      .getAninme(animeController.animeID)
                                      .then((value) {
                                    Get.to(AnimeDetailScreen());
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              animeController.animeList[index]
                                                  .image!.jpg.image_url,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              animeController
                                                  .animeList[index].title
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            animeController
                                                .animeList[index].type
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            animeController
                                                    .animeList[index].episodes
                                                    .toString() +
                                                " episodes",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ))),
        ],
      ),
    );
  }
}
