// To parse this JSON data, do
//
//     final localVideoModel = localVideoModelFromMap(jsonString);

import 'dart:convert';

import 'package:tiktox/domain/entities/video_post.dart';

LocalVideoModel localVideoModelFromMap(String str) =>
    LocalVideoModel.fromMap(json.decode(str));

String localVideoModelToMap(LocalVideoModel data) => json.encode(data.toMap());

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromMap(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"] ?? 'No name',
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
      };

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
