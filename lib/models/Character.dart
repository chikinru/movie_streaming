import 'Images.dart';

class CharacterModel {
  CharacterModel({required this.data});
  List<CharData>? data;
  CharacterModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CharData>[];
      json['data'].forEach((v) {
        data!.add(new CharData.fromJson(v));
      });
    } else {
      null;
    }
  }
}

class CharData {
  CharData({
    required this.character,
    required this.role,
    required this.favorites,
    required this.voiceActor,
  });
  Character? character;
  String role;
  int favorites;
  List<VoiceActor>? voiceActor;

  factory CharData.fromJson(Map<String, dynamic> json) => CharData(
      character: Character.fromJson(json["character"]),
      role: json["role"],
      favorites: json["favorites"],
      voiceActor: (json['voice_actors'] as List<dynamic>?)
          ?.map((e) => VoiceActor.fromJson(e as Map<String, dynamic>))
          .toList());
}

class Character {
  Character({
    required this.mal_id,
    required this.url,
    required this.images,
    required this.name,
  });
  int mal_id;
  String url;
  Images images;
  String name;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
      name: json["name"],
      mal_id: json["mal_id"],
      url: json["url"],
      images: Images.fromJson(json["images"]));

  Map<String, dynamic> toJson() =>
      {"mal_id": mal_id, "url": url, "images": images};
}

class VoiceActor {
  VoiceActor({
    required this.person,
    required this.language,
  });
  Person person;
  String language;

  factory VoiceActor.fromJson(Map<String, dynamic> json) => VoiceActor(
      person: Person.fromJson(json["person"]), language: json["language"]);

  Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "language": language,
      };
}

class Person {
  Person({
    required this.mal_id,
    required this.url,
    required this.name,
  });
  int mal_id;
  String url;

  String name;

  factory Person.fromJson(Map<String, dynamic> json) {
    return new Person(
      mal_id: json["mal_id"],
      url: json["url"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mal_id": mal_id,
        "url": url,
        "name": name,
      };
}
