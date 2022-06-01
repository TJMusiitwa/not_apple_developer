// To parse this JSON data, do
//
//     final discover = discoverFromJson(jsonString);

import 'dart:convert';

List<Discover> discoverFromJson(String str) =>
    List<Discover>.from(json.decode(str).map((x) => Discover.fromJson(x)));

class Discover {
  Discover({
    required this.discoverTitle,
    required this.discoverCollection,
    required this.discoverImage,
    required this.sectionTitle,
  });

  final String discoverTitle;
  final String discoverCollection;
  final String discoverImage;
  final String sectionTitle;

  factory Discover.fromRawJson(String str) =>
      Discover.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Discover.fromJson(Map<String, dynamic> json) => Discover(
        discoverTitle: json["discoverTitle"],
        discoverCollection: json["discoverCollection"] ?? '',
        discoverImage: json["discoverImage"],
        sectionTitle: json["sectionTitle"],
      );

  Map<String, dynamic> toJson() => {
        "discoverTitle": discoverTitle,
        "discoverCollection": discoverCollection,
        "discoverImage": discoverImage,
        "sectionTitle": sectionTitle,
      };
}
