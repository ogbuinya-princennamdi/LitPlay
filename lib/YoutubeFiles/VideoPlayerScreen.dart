import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LitVideoPlayerScreen extends StatefulWidget {
  final String videoId;
  const LitVideoPlayerScreen({super.key, required this.videoId});

  @override
  State<LitVideoPlayerScreen> createState() => _LitVideoPlayerScreenState();
}

class _LitVideoPlayerScreenState extends State<LitVideoPlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _loadLikedState();
  }

  Future<void> _loadLikedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = prefs.getBool(widget.videoId) ?? false; // Use videoId as the key
    });
  }


  Future<void> _toggleLiked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = !_isLiked; // Toggle the like state
    });
    await prefs.setBool(widget.videoId, _isLiked); // Save the updated state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LITplayer',style: TextStyle(color: Colors.red),),
      ),
      body: Column(

        children: [

          SizedBox(height: 250,),
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Like button
                IconButton(
                  onPressed: _toggleLiked,
                  icon: Icon(
                    _isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: _isLiked ? Colors.blue : Colors.grey,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10),

          Text(
            _isLiked ? "You liked this video!" : "You haven't liked this video yet.",
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
        ],
      ),
    );
  }
}