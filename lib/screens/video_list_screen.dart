import 'package:flutter/material.dart';
import '../services/youtube_service.dart';
import '../widgets/video_card.dart';

class VideoListScreen extends StatelessWidget {
  final String grade;
  final String subject;

  const VideoListScreen({Key? key, required this.grade, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$grade - $subject Videos'),
          backgroundColor: Colors.yellow),
      body: FutureBuilder<List>(
        future: fetchVideos(grade, subject),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final videos = snapshot.data!;
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return VideoCard(video: videos[index]);
              },
            );
          } else {
            return const Center(child: Text('No videos found.'));
          }
        },
      ),
    );
  }
}
