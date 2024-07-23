import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids_education_and_entertainment_app/component/item.dart';
import 'package:kids_education_and_entertainment_app/controller/constants_alpha.dart';
//import 'package:kids_education_and_entertainment_app/controller/const.dart';
// import 'package:kids_education_and_entertainment_app/Controller/c_screenl.dart';

class AlphabetScreen extends StatefulWidget {
    const AlphabetScreen({super.key}); 
  @override
  AlphabetScreenState createState() => AlphabetScreenState();
}

class AlphabetScreenState extends State<AlphabetScreen> {
  bool isTimerEnabled = false;
  List<Item> items = AlphabetConstantsAlpha.alphabetItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              AlphabetConstantsAlpha.A_Z,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isTimerEnabled
                        ? WidgetStateProperty.all(Colors.green)
                        : WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    setState(() {
                      isTimerEnabled = !isTimerEnabled;
                    });
                  },
                  child: const Text(
                    'Auto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
          childAspectRatio: 0.8,
          children: List.generate(
            items.length,
            (index) => ItemTile(
              index: index,
              items: items,
              isTimerEnabled: isTimerEnabled,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int index;
  final List<Item> items;
  final bool isTimerEnabled;

  const ItemTile({
    super.key,
    required this.index,
    required this.items,
    required this.isTimerEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final item = items[index];
    return Card(
      color: item.backgroundColor,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return PopupDialog(
                items: items,
                currentIndex: index,
                isAutoNextEnabled: isTimerEnabled,
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Image.asset(
                  item.iconAsset,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.center,
                );
              }),
              const SizedBox(height: 10),
              Text(item.description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

class PopupDialog extends StatefulWidget {
  final List<Item> items;
  final int currentIndex;
  final bool isAutoNextEnabled;

  const PopupDialog({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.isAutoNextEnabled,
  });

  @override
  PopupDialogState createState() => PopupDialogState();
}

class PopupDialogState extends State<PopupDialog> {
  late FlutterTts flutterTts;
  late int currentIndex;
  Timer? timer;
  late bool isAutoNextEnabled;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    currentIndex = widget.currentIndex;
    isAutoNextEnabled = widget.isAutoNextEnabled;

    initializeTTS();
    _speak();
    if (isAutoNextEnabled) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
        _nextItem();
      });
    }
  }

  Future<void> initializeTTS() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  @override
  void dispose() {
    timer?.cancel();
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _speak() async {
    await flutterTts.stop();
    await flutterTts.speak(widget.items[currentIndex].description);
  }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        _speak();
      }
    });
  }

  void _nextItem() {
    setState(() {
      if (currentIndex < widget.items.length - 1) {
        currentIndex++;
        _speak();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = widget.items[currentIndex];
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Container(
        padding: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            color: currentItem.backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentItem.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    currentItem.iconAsset,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentItem.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _previousItem,
                        child: const Text('Prev'),
                      ),
                      ElevatedButton(
                        onPressed: _nextItem,
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(216, 233, 101, 92),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AlphabetScreen(),
  ));
}
