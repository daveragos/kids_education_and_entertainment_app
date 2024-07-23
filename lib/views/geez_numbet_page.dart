import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kids_education_and_entertainment_app/component/card_geez_number.dart';
import 'package:kids_education_and_entertainment_app/controller/c_screenl.dart';

class GeezNumbetPage extends StatefulWidget {
  const GeezNumbetPage({super.key});

  @override
  _GeezNumbetPageState createState() => _GeezNumbetPageState();
}

class _GeezNumbetPageState extends State<GeezNumbetPage> {
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text('Geez'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
              _buildScreenRow(
                onpressedBtn1: () =>
                    onClick(newAudio: PathAudioGeezNumber.num1),
                onpressedBtn2: () =>
                    onClick(newAudio: PathAudioGeezNumber.num2),
                image1: Image.asset(
                  'assets/images/geez1.gif',
                ),
                image2: Image.asset(
                  'assets/images/geez2.gif',
                ),
              ),
              const SizedBox(height: 5),
              _buildScreenRow(
                onpressedBtn1: () =>
                    onClick(newAudio: PathAudioGeezNumber.num3),
                onpressedBtn2: () =>
                    onClick(newAudio: PathAudioGeezNumber.num4),
                image1: Image.asset(
                  'assets/images/geez3.gif',
                ),
                image2: Image.asset(
                  'assets/images/d1.png',
                ),
              ),
              const SizedBox(height: 5),
              _buildScreenRow(
                onpressedBtn1: () =>
                    onClick(newAudio: PathAudioGeezNumber.num5),
                onpressedBtn2: () =>
                    onClick(newAudio: PathAudioGeezNumber.num6),
                image1: Image.asset(
                  'assets/images/e1.png',
                ),
                image2: Image.asset(
                  'assets/images/f1.png',
                ),
              ),
              const SizedBox(height: 5),
              _buildScreenRow(
                onpressedBtn1: () =>
                    onClick(newAudio: PathAudioGeezNumber.num7),
                onpressedBtn2: () =>
                    onClick(newAudio: PathAudioGeezNumber.num8),
                image1: Image.asset(
                  'assets/images/g1.png',
                ),
                image2: Image.asset(
                  'assets/images/h1.png',
                ),
              ),
              const SizedBox(height: 5),
              _buildScreenRow(
                onpressedBtn1: () =>
                    onClick(newAudio: PathAudioGeezNumber.num9),
                onpressedBtn2: () => onClick(newAudio: PathAudioAlphabet.j),
                image1: Image.asset(
                  'assets/images/i1.png',
                ),
                image2: Image.asset(
                  'assets/images/j1.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenRow({
    required Function() onpressedBtn1,
    required Function() onpressedBtn2,
    required Image image1,
    required Image image2,
  }) {
    return ScreenRowGeezNumbet(
      onpressedBtn1: onpressedBtn1,
      onpressedBtn2: onpressedBtn2,
      image1: image1,
      image2: image2,
    );
  }

  void onClick({required String newAudio}) async {
    audioPlayer.stop();
    await audioPlayer.play(AssetSource(newAudio));
  }
}
