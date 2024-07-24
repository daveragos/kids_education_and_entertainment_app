import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids_education_and_entertainment_app/controller/const.dart';
import 'package:kids_education_and_entertainment_app/component/item.dart';
import 'package:kids_education_and_entertainment_app/controller/constants_amharic.dart';

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
      child: InkWell(
        onTap: () {
          List<Item> itams = items.getRange(index, index + 6).toList();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FidelList(
                items: itams,
                index: index,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: item.backgroundColor,
            gradient: item.backgroundGradient,
          ),
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
                  fontFamily: 'NotoSansEthiopic', // Use the Amharic font
                ),
                textAlign: TextAlign.center,
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    item.iconAsset,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.center,
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'NotoSansEthiopic', // Use the Amharic font
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FidelList extends StatelessWidget {
  final List<Item> items;
  final int index;

  const FidelList({
    required this.items,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(items[index].title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].description),
            );
          },
        ));
  }
}

class _PopupDialog extends StatefulWidget {
  final List<Item> items;
  final int currentIndex;
  final bool isAutoNextEnabled;

  const _PopupDialog({
    required this.items,
    required this.currentIndex,
    required this.isAutoNextEnabled,
  });

  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<_PopupDialog> {
  late FlutterTts flutterTts;
  late int currentIndex;
  late Timer? timer;
  late bool isAutoNextEnabled;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    currentIndex = widget.currentIndex;
    isAutoNextEnabled = widget.isAutoNextEnabled;

    _initializeTts();
    _speakDescription();
    if (isAutoNextEnabled) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
        _nextItem();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _initializeTts() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    if (languages.contains("am-ET")) {
      await flutterTts.setLanguage("am-ET");
    } else {
      print("Amharic language not supported on this device.");
    }
  }

  Future<void> _speakDescription() async {
    final currentItem = widget.items[currentIndex];
    await flutterTts.speak(currentItem.title);
    await flutterTts.speak(currentItem.description);
  }

  Future<void> _speakText(String text) async {
    await flutterTts.speak(text);
  }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        _speakDescription();
      }
    });
  }

  void _nextItem() {
    setState(() {
      if (currentIndex < widget.items.length - 1) {
        currentIndex++;
        _speakDescription();
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
          borderRadius: BorderRadius.circular(15),
        ),
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
                      fontFamily: 'NotoSansEthiopic', // Use the Amharic font
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Const.heightMedium),
                  GestureDetector(
                    onTap: () {
                      _speakText(currentItem.description);
                    },
                    child: SvgPicture.asset(
                      currentItem.iconAsset,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(height: Const.heightMedium),
                  Text(
                    currentItem.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontFamily: 'NotoSansEthiopic', // Use the Amharic font
                    ),
                  ),
                  const SizedBox(height: Const.heightMedium),
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
                  const SizedBox(height: Const.heightMedium),
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

class AmaharicFidel extends StatefulWidget {
  const AmaharicFidel({super.key});

  @override
  State<AmaharicFidel> createState() => _AmaharicFidelState();
}

class _AmaharicFidelState extends State<AmaharicFidel> {
  bool isTimerEnabled = false;

  List<Item> items = AppConstantsAmharic.fidelItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              AppConstantsAmharic.A_z,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansEthiopic', // Use the Amharic font
              ),
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
              items.length ~/ 7,
              (index) {
                int itemIndex = (index * 7) + 1;
                if (itemIndex <= items.length) {
                  return ItemTile(
                    index: itemIndex - 1,
                    items: items,
                    isTimerEnabled: isTimerEnabled,
                  );
                } else {
                  return SizedBox
                      .shrink(); // Return an empty widget if the index is out of bounds
                }
              },
            ),
          )),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AmaharicFidel(),
  ));
}
