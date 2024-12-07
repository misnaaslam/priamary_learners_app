class Video {
  final String title;
  final String thumbnailUrl;
  final String videoUrl;

  Video({required this.title, required this.thumbnailUrl, required this.videoUrl});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['snippet']['title'],
      thumbnailUrl: json['snippet']['thumbnails']['high']['url'],
      videoUrl: 'https://www.youtube.com/watch?v=${json['id']['videoId']}',
    );
  }
}
