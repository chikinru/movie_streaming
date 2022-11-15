import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

class MyListCard extends StatelessWidget {
  const MyListCard({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Container(
      child: Row(children: [
        // Movie picture and click events
        Container(
            // decoration image is watchlist items
            // decoration: BoxDecoration(image: ),
            child: CircleAvatar(
          child: IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              //to animeDetailScreen
            },
          ),
        )),
        SizedBox(),
        Text("Anime name 1"),
        SizedBox(),
        Text("Season "),
        SizedBox(),
        Container(
          child: Text("rating"),
        ),
        SizedBox()
        // remove button
      ]),
    );
  }
}
