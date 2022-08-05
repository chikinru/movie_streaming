import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

class CategoryCard extends StatelessWidget {
  AnimeController animeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 79,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3F47),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      animeController.anime[0].genres[index].name,
                      style: GoogleFonts.questrial(
                          color: Colors.white, fontSize: 13),
                    ),
                  ),
                );
              },
              itemCount: animeController.anime[0].genres.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
