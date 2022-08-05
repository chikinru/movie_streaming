import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Scaffold(
      body: Center(
        child: Container(
            color: Color(0xFF333333),
            child: GridView.count(crossAxisCount: 3, children: [
              for (var i = 0; i < animeController.topAnime.value.length; i++)
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Text(
                        '${i + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                            animeController.topAnime.value[i].imageUrl,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
            ])),
      ),
    );
  }
}
