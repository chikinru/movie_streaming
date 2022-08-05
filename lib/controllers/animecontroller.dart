import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jikan_api/jikan_api.dart';
import 'package:movie_streaming/models/TopAnime.dart';

class AnimeController extends GetxController {
  var topAnime = <Top>[].obs;
  var actionAnime = <AnimeItem>[].obs;
  var romanceAnime = <AnimeItem>[].obs;
  var survivalAnime = <AnimeItem>[].obs;
  var horrorAnime = <AnimeItem>[].obs;
  var animeReviews = <Review>[].obs;
  var animeSeason = <Season>[].obs;
  var animeNextSeason = <Season>[].obs;

  var anime = <Anime>[].obs;
  var animeID = 0.obs;
  var animeGerne = <GenericInfo>[].obs;

  var isLoading = true.obs;
  var genre = 0.obs;
  var gerneID = 0.obs;
  void onInit() async {
    super.onInit();
    await getTopAnime();
    for (int i = 0; i < 4; i++) await getAnimeByGenre(i);

    await getThisSeason();
  }

  Future<void> getAnimeByGenre(int genre) async {
    Jikan jikan = Jikan();
    //get genre id

    if (genre == 1) {
      gerneID.value = 1;
    } else if (genre == 2) {
      gerneID.value = 22;
    } else if (genre == 3) {
      gerneID.value = 76;
    } else if (genre == 4) {
      gerneID.value = 14;
    } else {
      gerneID.value = 0;
    }
    if (gerneID == 1) {
      var anime = await jikan.getGenre(gerneID.value, GenreType.anime);
      var animeList = anime.anime!.toList();
      actionAnime.addAll(animeList);
      isLoading.value = false;
    } else if (gerneID == 22) {
      var anime = await jikan.getGenre(gerneID.value, GenreType.anime);
      var animeList = anime.anime!.toList();
      romanceAnime.addAll(animeList);
      isLoading.value = false;
    } else if (gerneID == 76) {
      var anime = await jikan.getGenre(gerneID.value, GenreType.anime);
      var animeList = anime.anime!.toList();
      survivalAnime.addAll(animeList);
      isLoading.value = false;
    } else if (gerneID == 14) {
      var anime = await jikan.getGenre(gerneID.value, GenreType.anime);
      var animeList = anime.anime!.toList();
      horrorAnime.addAll(animeList);
      isLoading.value = false;
    } else {
      getTopAnime();
      isLoading.value = false;
    }
  }

  Future<void> getTopAnime() async {
    Jikan jikan = Jikan();
    var top = await jikan.getTop(TopType.anime);
    if (top.isNotEmpty) {
      topAnime.addAll(top);
      isLoading.value = true;
    } else {
      isLoading.value = false;
    }
  }

  Future<void> getAninme(var animeID) async {
    Jikan jikan = Jikan();
    var animeitem = await jikan.getAnimeInfo(animeID.value);
    anime.add(animeitem);
  }

  Future<void> getAnimeGenre(var animeID) async {
    Jikan jikan = Jikan();
    var animeitem = await jikan.getAnimeInfo(animeID.value);
    var animeGenre = animeitem.genres.toList();
    animeGerne.addAll(animeGenre);
  }

  Future<void> searchAnime(var animeID) async {
    Jikan jikan = Jikan();
  }

  Future<void> getReview(var animeID) async {
    Jikan jikan = Jikan();
    var reviews = await jikan.getAnimeReviews(animeID.value);
    animeReviews.addAll(reviews);
  }

  Future<void> getThisSeason() async {
    SeasonType season = SeasonType.winter;
    Jikan jikan = Jikan();
    var year = DateTime.now().year.toInt();
    if (DateTime.now().month >= 1 && DateTime.now().month <= 3) {
      season = SeasonType.winter;
    } else if (DateTime.now().month >= 4 && DateTime.now().month <= 6) {
      season = SeasonType.spring;
    } else if (DateTime.now().month >= 7 && DateTime.now().month <= 9) {
      season = SeasonType.summer;
    } else if (DateTime.now().month >= 10 && DateTime.now().month <= 12) {
      season = SeasonType.fall;
    }
    var anime = await jikan.getSeason(year: year, season: season);
    animeSeason.add(anime);
    animeNextSeason.add(await jikan.getSeasonLater());
  }
}
