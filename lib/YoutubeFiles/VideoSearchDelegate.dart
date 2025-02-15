import 'package:flutter/material.dart';
import 'package:litplay/YoutubeFiles/Youtubeservices.dart';
import 'package:litplay/splash/loadLogo.dart';

import 'VideoPlayerScreen.dart';

class VideoSearchDelegate extends SearchDelegate<String?> {
  final Youtubeservices _youtubeservices;

  VideoSearchDelegate(this._youtubeservices);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _youtubeservices.fetchVideosByKeyword(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: loadLogo());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No videos found'));
        } else {
          final videos = snapshot.data!;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return ListTile(
                leading: Image.network(video['thumbnailUrl']),
                title: Text(video['title']),
                onTap: () {
                  close(context, null);
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
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> resentSearches= [
      ' VDM and Nedu',
      'J.D vance and E.U',
      'deeone and VDM',
      'Nigeria politics'
    ];
    final suggestions= query.isEmpty
    ? resentSearches
        :resentSearches .where ((search)=>search.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
        itemBuilder: (context,index){
        final suggestion=suggestions[index];
        return ListTile(
          leading: Icon(Icons.search),
          title: Text(suggestion),
          onTap: (){
            query=suggestion;
            showResults(context);
          },
        );

        }
    );
  }
}