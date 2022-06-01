// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

List<Video> videoFromJson(String str) =>
    List<Video>.from(json.decode(str).map((x) => Video.fromJson(x)));

class Video {
  Video({
    required this.videoTitle,
    required this.collection,
    required this.platforms,
    required this.description,
    required this.videoThumbnail,
  });

  final String videoTitle;
  final String collection;
  final String platforms;
  final String description;
  final String videoThumbnail;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        videoTitle: json["videoTitle"],
        collection: json["collection"],
        platforms: json["platforms"] ?? '',
        description: json["description"],
        videoThumbnail: json["videoThumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "videoTitle": videoTitle,
        "collection": collection,
        "platforms": platforms,
        "description": description,
        "videoThumbnail": videoThumbnail,
      };
}
