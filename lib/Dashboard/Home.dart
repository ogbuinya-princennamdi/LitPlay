import 'package:flutter/material.dart';
import 'package:litplay/splash/loadLogo.dart';
import '../YoutubeFiles/VideoPlayerScreen.dart';
import '../YoutubeFiles/Youtubeservices.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Youtubeservices _youtubeservices = Youtubeservices.instance;
  List<Map<String, dynamic>> _videos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    try {
      final videos = await _youtubeservices.fetchVideosByKeyword('USA');
      setState(() {
        _videos = videos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching videos: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LITplay Videos', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: _isLoading
          ? Center(child: loadLogo())
          : ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];
          return ListTile(
            leading: Image.network(video['thumbnailUrl']),
            title: Text(video['title'], style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold),),

            onTap: () {
              // Open the video in a player
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LitVideoPlayerScreen(
                    videoId: video['videoId'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
