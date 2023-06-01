import 'package:flutter/material.dart';
import 'package:tiktox/config/tools/human_format.dart';
import 'package:tiktox/domain/entities/video_post.dart';

class VideoButtonWidget extends StatelessWidget {
  const VideoButtonWidget({Key? key, required this.video}) : super(key: key);

  final VideoPost video;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes, icon: Icons.favorite, color: Colors.red),
        _CustomIconButton(value: video.views, icon: Icons.remove_red_eye),
        const _CustomIconButton(
            value: 0, icon: Icons.play_circle_fill_outlined),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton(
      {required this.value, required this.icon, this.color});

  final int value;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: color ?? Colors.white,
              size: 30,
            )),
        Text(HumanFormat.humanReadbleFormat(value.toDouble()))
      ],
    );
  }
}
