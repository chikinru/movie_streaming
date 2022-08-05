// To parse this JSON data, do
//
//     final topAnime = topAnimeFromJson(jsonString);

import 'dart:convert';

TopAnime topAnimeFromJson(String str) => TopAnime.fromJson(json.decode(str));

String topAnimeToJson(TopAnime data) => json.encode(data.toJson());

class TopAnime {
  TopAnime({
    required this.data,
    required this.pagination,
  });

  List<Datum> data;
  Pagination pagination;

  factory TopAnime.fromJson(Map<String, dynamic> json) => TopAnime(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Datum {
  Datum({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  int malId;
  String url;
  Map<String, Image> images;
  Trailer trailer;
  bool approved;
  List<String> titles;
  String title;
  String titleEnglish;
  String titleJapanese;
  List<String> titleSynonyms;
  String type;
  String source;
  int episodes;
  String status;
  bool airing;
  Aired aired;
  String duration;
  String rating;
  int score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  String season;
  int year;
  Broadcast broadcast;
  List<Demographic> producers;
  List<Demographic> licensors;
  List<Demographic> studios;
  List<Demographic> genres;
  List<Demographic> explicitGenres;
  List<Demographic> themes;
  List<Demographic> demographics;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"])
            .map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        trailer: Trailer.fromJson(json["trailer"]),
        approved: json["approved"],
        titles: List<String>.from(json["titles"].map((x) => x)),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"],
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        season: json["season"],
        year: json["year"],
        broadcast: Broadcast.fromJson(json["broadcast"]),
        producers: List<Demographic>.from(
            json["producers"].map((x) => Demographic.fromJson(x))),
        licensors: List<Demographic>.from(
            json["licensors"].map((x) => Demographic.fromJson(x))),
        studios: List<Demographic>.from(
            json["studios"].map((x) => Demographic.fromJson(x))),
        genres: List<Demographic>.from(
            json["genres"].map((x) => Demographic.fromJson(x))),
        explicitGenres: List<Demographic>.from(
            json["explicit_genres"].map((x) => Demographic.fromJson(x))),
        themes: List<Demographic>.from(
            json["themes"].map((x) => Demographic.fromJson(x))),
        demographics: List<Demographic>.from(
            json["demographics"].map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trailer": trailer.toJson(),
        "approved": approved,
        "titles": List<dynamic>.from(titles.map((x) => x)),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "season": season,
        "year": year,
        "broadcast": broadcast.toJson(),
        "producers": List<dynamic>.from(producers.map((x) => x.toJson())),
        "licensors": List<dynamic>.from(licensors.map((x) => x.toJson())),
        "studios": List<dynamic>.from(studios.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "explicit_genres":
            List<dynamic>.from(explicitGenres.map((x) => x.toJson())),
        "themes": List<dynamic>.from(themes.map((x) => x.toJson())),
        "demographics": List<dynamic>.from(demographics.map((x) => x.toJson())),
      };
}

class Aired {
  Aired({
    required this.from,
    required this.to,
    required this.prop,
  });

  String from;
  String to;
  Prop prop;

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"],
        to: json["to"],
        prop: Prop.fromJson(json["prop"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "prop": prop.toJson(),
      };
}

class Prop {
  Prop({
    required this.from,
    required this.to,
    required this.string,
  });

  From from;
  From to;
  String string;

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "to": to.toJson(),
        "string": string,
      };
}

class From {
  From({
    required this.day,
    required this.month,
    required this.year,
  });

  int day;
  int month;
  int year;

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Broadcast {
  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  String day;
  String time;
  String timezone;
  String string;

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"],
        time: json["time"],
        timezone: json["timezone"],
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "time": time,
        "timezone": timezone,
        "string": string,
      };
}

class Demographic {
  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int malId;
  String type;
  String name;
  String url;

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
      };
}

class Image {
  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  String imageUrl;
  String smallImageUrl;
  String largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Trailer {
  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
  });

  String youtubeId;
  String url;
  String embedUrl;

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json["youtube_id"],
        url: json["url"],
        embedUrl: json["embed_url"],
      );

  Map<String, dynamic> toJson() => {
        "youtube_id": youtubeId,
        "url": url,
        "embed_url": embedUrl,
      };
}

class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.items,
  });

  int lastVisiblePage;
  bool hasNextPage;
  Items items;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
        items: Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
        "items": items.toJson(),
      };
}

class Items {
  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  int count;
  int total;
  int perPage;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json["count"],
        total: json["total"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
        "per_page": perPage,
      };
}
