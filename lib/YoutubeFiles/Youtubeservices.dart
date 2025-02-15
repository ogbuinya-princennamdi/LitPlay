import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Youtubeservices {
  static final Youtubeservices instance = Youtubeservices._internal();
  late String apiKey;

  Youtubeservices._internal() {
    apiKey = dotenv.env['API_KEY'] ?? '';
    if (apiKey.isEmpty) {
      throw Exception('API key is missing or not set in .env');
    }
  }

  // Fetch videos by keyword
  Future<List<Map<String, dynamic>>> fetchVideosByKeyword(String keyword) async {
    final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/search?'
          'part=snippet&'
          'q=$keyword&'
          'type=video&'
          'maxResults=1000&'
          'key=$apiKey',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> items = data['items'];

        // Extract video details
        return items.map((item) {
          final snippet = item['snippet'];
          return {
            'videoId': item['id']['videoId'],
            'title': snippet['title'],
            'description': snippet['description'],
            'thumbnailUrl': snippet['thumbnails']['medium']['url'],

          };
        }).toList();
      } else {
        throw Exception('Failed to load videos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching videos: $e');
    }
  }
}