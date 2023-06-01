import 'package:flutter/material.dart';
import 'package:tiktox/domain/entities/video_post.dart';
import 'package:tiktox/infra/models/local_video_model.dart';
import 'package:tiktox/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(
        const Duration(seconds: 2)); //!simulacion de carga asincrona

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromMap(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
