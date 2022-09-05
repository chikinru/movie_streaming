class Images {
  Jpg jpg;
  Webp webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: Jpg.fromJson(json["jpg"]),
        webp: Webp.fromJson(json["webp"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg.toJson(),
        "webp": webp.toJson(),
      };
}

class Webp {
  String image_url;
  String? small_image_url;
  String? large_image_url;

  Webp(
      {required this.image_url,
      required this.small_image_url,
      required this.large_image_url});

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        image_url: json["image_url"],
        small_image_url: json["small_image_url"],
        large_image_url: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": image_url,
        "small_image_url": small_image_url,
        "large_image_url": large_image_url,
      };
}

class Jpg {
  String image_url;
  String? small_image_url;
  String? large_image_url;

  Jpg(
      {required this.image_url,
      required this.small_image_url,
      required this.large_image_url});

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        image_url: json["image_url"],
        small_image_url: json["small_image_url"],
        large_image_url: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": image_url,
        "small_image_url": small_image_url,
        "large_image_url": large_image_url,
      };
}
