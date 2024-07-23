import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Fixed typo in the import statement
import 'package:kids_education_and_entertainment_app/Model/m_learn.dart';
import 'package:kids_education_and_entertainment_app/component/card_learn.dart';
import 'package:kids_education_and_entertainment_app/controller/c_learn.dart';

class PageLearning extends StatefulWidget {
  const PageLearning({super.key});

  @override
  PageLearningState createState() => PageLearningState();
}

class PageLearningState extends State<PageLearning> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playBackgroundMusic();
  }

  void _playBackgroundMusic() async {
    _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(AssetSource('audios/background_music.m4a'));
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/learn_page.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(0, 218, 110, 110),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 120),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ControllerLearn.dataLength,
              itemBuilder: (context, index) {
                ModelLearn edu = ControllerLearn.dataLearn.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: CardLearn(
                    data: edu,
                    title: edu.title,
                    screen: edu.page,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
