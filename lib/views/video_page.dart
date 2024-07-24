import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PageVideo extends StatefulWidget {
  @override
  _PageVideoState createState() => _PageVideoState();
}

class _PageVideoState extends State<PageVideo> {
  final List<Map<String, String>> _videos = [
    {
      'title': 'Wendme Yakob',
      'videoId': 'hJglP1lvqo',
    },
    {
      'title': 'desta ena fikeir',
      'videoId': '3l_Ks9GZgz0',
    },
    {
      'title': 'Che Ferese',
      'videoId': '6rMAIRqBNos',
    },
  ];

  String _currentTitle = 'Select a Video';
  String? _currentVideoId;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (_currentVideoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: _currentVideoId!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    }
  }

  void _onVideoSelect(String videoId, String title) {
    setState(() {
      _currentVideoId = videoId;
      _currentTitle = title;
      _controller = YoutubePlayerController(
        initialVideoId: _currentVideoId!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Videos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _currentTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (_currentVideoId != null)
            Expanded(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  _controller.addListener(() {});
                },
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_videos[index]['title']!),
                  onTap: () {
                    _onVideoSelect(
                      _videos[index]['videoId']!,
                      _videos[index]['title']!,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
