// To parse this JSON data, do
//
//     final gov = govFromJson(jsonString);

import 'dart:convert';

class Gov {
  List<Gouvernorat> gouvernorats;

  Gov({
    this.gouvernorats,
  });

  factory Gov.fromJson(String str) => Gov.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gov.fromMap(Map<String, dynamic> json) => Gov(
    gouvernorats: json["gouvernorats"] == null ? null : List<Gouvernorat>.from(json["gouvernorats"].map((x) => Gouvernorat.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "gouvernorats": gouvernorats == null ? null : List<dynamic>.from(gouvernorats.map((x) => x.toMap())),
  };
}

class Gouvernorat {
  String gouvernorat;
  List<String> villes;

  Gouvernorat({
    this.gouvernorat,
    this.villes,
  });

  factory Gouvernorat.fromJson(String str) => Gouvernorat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gouvernorat.fromMap(Map<String, dynamic> json) => Gouvernorat(
    gouvernorat: json["gouvernorat"] == null ? null : json["gouvernorat"],
    villes: json["villes"] == null ? null : List<String>.from(json["villes"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "gouvernorat": gouvernorat == null ? null : gouvernorat,
    "villes": villes == null ? null : List<dynamic>.from(villes.map((x) => x)),
  };
}
