import 'package:flutter/material.dart';
import '../model/video_model.dart';
import '../screens/video_player_screen.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade100,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.network(video.thumbnailUrl),
        title: Text(video.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(videoUrl: video.videoUrl),
            ),
          );
        },
      ),
    );
  }
}
