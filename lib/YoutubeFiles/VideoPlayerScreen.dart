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
  bool _isNotLiked= false;
  String message= "";

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
    _loadUnlikedState();
  }

  Future<void> _loadLikedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = prefs.getBool('${widget.videoId}_liked') ?? false;

      if(_isLiked){
        message='you have liked this video';
      }else if(_isNotLiked){
        message='you have disliked this video';
      }else{
        message="you haven't liked or disliked this video";
      }

    });
  }
Future<void> _loadUnlikedState() async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    setState(() {
      _isNotLiked = prefs.getBool('${widget.videoId}_notLiked') ?? false;

      if(_isNotLiked){
        message='you have disliked this video';
      }else if(_isLiked){
        message="you have liked this video";
      }
    });
}

  Future<void> _toggleLiked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = !_isLiked;
      if(_isLiked){
        message="you have liked this video";
      }
      else{
        message=" you haven't liked or dislike this video";
      }
    });
    await prefs.setBool(widget.videoId,_isLiked);


  }
  Future<void> _toggleUnLiked() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    setState(() {
      _isNotLiked = !_isNotLiked;
      if(_isNotLiked){
        message="you have disliked this video";
      }
      else{
        message=" you haven't liked or dislike this video";
      }

    });
    await prefs.setBool(widget.videoId, _isNotLiked);
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
                IconButton(
                    onPressed:_toggleUnLiked,
                    icon: Icon(Icons.thumb_down_alt_outlined,
                    color: _isNotLiked ?Colors.red :Colors.grey),
                ),

              ],
            ),
          ),
          SizedBox(height: 10),

          Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),

        ],
      ),
    );
  }
}