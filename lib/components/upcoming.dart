import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming/local_files/file_manager.dart';

import '../controllers/animecontroller.dart';
import 'seeall.dart';
import 'upcomingcard.dart';

class UpComing extends StatelessWidget {
  const UpComing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Upcoming Animes',
                  style: GoogleFonts.questrial(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(SeeAll(caseSee: 2));
                  },
                  child: Text(
                    'See All',
                    style: GoogleFonts.questrial(
                        color: Color(0xFFF2C94C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            // UpComingCard(),
            ElevatedButton(
              onPressed: () {
                FileManager fileManager = new FileManager();
                fileManager.readData();
              },
              child: Text('UpComingCard'),
            ),
          ],
        ),
      ),
    );
  }
}
