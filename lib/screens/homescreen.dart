import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:movie_streaming/components/featured.dart';
import 'package:movie_streaming/components/thisseason.dart';
import 'package:movie_streaming/controllers/animecontroller.dart';

import '../components/bestanime.dart';
import '../components/upcoming.dart';
import 'animedetailscreen.dart';

class HomeScreen extends StatelessWidget {
  var _currentCarousel = 0.obs;
  var _malID = 0.obs;
  var _currentGenre = 0.obs;
  var _changeGenre = false.obs;
  var currentNav = 0.obs;
  @override
  Widget build(BuildContext context) {
    AnimeController animeController = Get.find();

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Obx(() => FloatingNavbar(
              onTap: (val) {
                currentNav.value = val;
                if (currentNav == 0) {
                  if (Get.currentRoute == HomeScreen()) {
                  } else {
                    Get.to(HomeScreen());
                  }
                } else if (currentNav == 1) {}
              },
              items: [
                FloatingNavbarItem(
                  title: 'Home',
                  icon: Icons.home,
                ),
                FloatingNavbarItem(
                  title: 'Search',
                  icon: Icons.search,
                ),
                FloatingNavbarItem(
                  title: 'Watchlist',
                  icon: Icons.tv_rounded,
                ),
                FloatingNavbarItem(
                  title: 'Profile',
                  icon: Icons.people,
                )
              ],
              currentIndex: currentNav.value,
            )),
        body: Container(
          height: Get.height,
          decoration: BoxDecoration(color: Color(0xFF333333)),
          child: SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(children: [
              // top section, featured movies, add to watchlist, movie details
              Featured(),
              // list view sections
              SizedBox(height: 40),
              BestAnimes(),
              SizedBox(height: 40),
              ThisSeasonAnime(),
              SizedBox(height: 40),
              UpComing(),
              SizedBox(height: 80),
            ]),
          ),
        ),
      ),
    );
  }
}
