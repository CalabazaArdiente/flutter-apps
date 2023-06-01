import 'package:flutter/material.dart';
import 'package:tiktox/domain/entities/video_post.dart';
import 'package:tiktox/presentation/widgets/widgets.dart';

class VideoScrollWidget extends StatelessWidget {
  const VideoScrollWidget({Key? key, required this.videos}) : super(key: key);

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtonWidget(video: videoPost))
          ],
        );
      },
    );
  }
}
