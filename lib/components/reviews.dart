import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

class Reviews extends StatelessWidget {
  var animeId = Get.arguments;
  Reviews({required this.animeId});

  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Container(
      width: Get.width,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: animeController.animeReviews.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(animeController.animeReviews.value[index].date),
                  subtitle:
                      Text(animeController.animeReviews.value[index].content),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: animeController.getReview(animeId),
      ),
    );
  }
}
