// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

List<Details> detailsFromJson(String str) =>
    List<Details>.from(json.decode(str).map((x) => Details.fromJson(x)));

class Details {
  Details({
    this.videoParentLink,
    this.videoParentLinkHref,
    required this.videoTitle,
    required this.videoDescription,
    this.videoResources,
    this.videoResourcesHref,
    this.videoTranscript,
    this.hdVideoSrc,
    this.sdVideoSrc,
  });

  final String? videoParentLink;
  final String? videoParentLinkHref;
  final String videoTitle;
  final String videoDescription;
  final String? videoResources;
  final String? videoResourcesHref;
  final String? videoTranscript;
  final String? hdVideoSrc;
  final String? sdVideoSrc;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        videoParentLink: json["video_parent_link"],
        videoParentLinkHref: json["video_parent_link-href"],
        videoTitle: json["video_title"],
        videoDescription: json["video_description"],
        // videoResources: json["video_resources"],
        // videoResourcesHref: json["video_resources-href"],
        videoTranscript: json["video_transcript"] ?? 'No video transcript',
        hdVideoSrc: json["hd_video_src"] ?? '',
        sdVideoSrc: json["sd_video_src"] ?? '',
      );
}
