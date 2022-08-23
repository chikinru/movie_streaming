import 'package:movie_streaming/models/Images.dart';

class AnimeSearch {
  AnimeSearch({
    required this.pagination,
    required this.data,
  });

  Pagination? pagination;
  List<Data>? data;

  AnimeSearch.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Data({
    required this.malId,
    required this.title,
    required this.episodes,
    required this.type,
    required this.duration,
    required this.season,
    required this.year,
    required this.image,
  });

  int? malId;
  String? title;
  int? episodes;
  String? type;
  String? duration;
  String? season;
  int? year;
  Images? image;
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        malId: json["mal_id"],
        title: json["title"],
        episodes: json["episodes"],
        type: json["type"],
        duration: json["duration"],
        season: json["season"],
        year: json["year"],
        image: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
      };
}

class Pagination {
  Pagination({
    required this.last_visible_page,
    required this.has_next_page,
    required this.current_page,
    required this.items,
  });
  int last_visible_page;
  bool has_next_page;
  int current_page;
  Items items;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        last_visible_page: json["last_visible_page"],
        has_next_page: json["has_next_page"],
        current_page: json["current_page"],
        items: Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": last_visible_page,
        "has_next_page": has_next_page,
        "current_page": current_page,
        "items": items.toJson(),
      };
}

class Items {
  Items({
    required this.count,
    required this.total,
    required this.per_page,
  });

  int count;
  int total;
  int per_page;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json["count"],
        total: json["total"],
        per_page: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
        "per_page": per_page,
      };
}
