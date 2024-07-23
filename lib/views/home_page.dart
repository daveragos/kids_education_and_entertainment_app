import 'package:flutter/material.dart';
import 'package:kids_education_and_entertainment_app/component/app_bar_simple.dart';
import 'package:kids_education_and_entertainment_app/component/drawer_custom.dart';
import 'package:kids_education_and_entertainment_app/component/navigation_bar.dart';
import 'package:kids_education_and_entertainment_app/views/learn_page.dart';
import 'package:kids_education_and_entertainment_app/views/apps_page.dart';
//import 'package:kids_education_and_entertainment_app/animated_background.dart';
//import 'package:kids_education_and_entertainment_app/views/number_screen.dart'; // Import NumberScreen
//import 'package:kids_education_and_entertainment_app/views/alphabet_screen.dart'; // Import AlphabetScreen
//import 'package:kids_education_and_entertainment_app/views/geez_numbet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexPage = 0;
  final List<Widget> _pages = [
    const PageLearning(),
    // PageVideo(),
    // PageStory(),
    const PageApps(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSimple(),
      drawer: DrawerCustom(),
      body: _pages[_indexPage],
      bottomNavigationBar: CustomNavigationBar(
        indexpage: _indexPage,
        onClock: (index) {
          setState(() {
            _indexPage = index;
          });
          // print('test');
        },
      ),
    );
  }
}
