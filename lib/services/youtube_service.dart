import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/video_model.dart';

const String apiKey = 'AIzaSyALms2Lj5QKKw5DIEYbRKresAfc9Snr9VQ';
const String baseUrl = 'https://www.googleapis.com/youtube/v3/search';

Future<List<Video>> fetchVideos(String grade, String subject) async {
  final response = await http.get(Uri.parse(
      '$baseUrl?part=snippet&q=$grade+$subject+lesson&key=$apiKey&type=video&maxResults=10'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['items'] as List).map((json) => Video.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch videos');
  }
}
