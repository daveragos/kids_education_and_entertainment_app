import 'dart:collection';
import 'package:kids_education_and_entertainment_app/Model/m_learn.dart';
import 'package:kids_education_and_entertainment_app/views/alphabet_screen.dart';
//import 'package:kids_education_and_entertainment_app/views/fidel_Screen.dart';
//import 'package:kids_education_and_entertainment_app/views/alphabet_Screen2.dart';
import 'package:kids_education_and_entertainment_app/views/amaharic_fidel.dart';
import 'package:kids_education_and_entertainment_app/views/number_screen.dart';
import 'package:kids_education_and_entertainment_app/views/geez_numbet_page.dart';
//import 'package:kids_education_and_entertainment_app/component/item.dart';
import 'package:kids_education_and_entertainment_app/views/fide_screen.dart';

class ControllerLearn {
  static final List<ModelLearn> _dataLearn = [
    ModelLearn(
      // image: 'assets/images/arabica.png',
      image: 'assets/images/geeznumber.gif',
      title: 'Learn Geez',
      page: const GeezNumbetPage(),
    ),
    ModelLearn(
      title: 'Learn Alphabet',
      image: 'assets/images/alphabet.gif',
      page: const AlphabetScreen(),
    ),
    ModelLearn(
      title: 'Learn Numbers',
      // image: 'assets/images/imagefour.jpg',
      image: 'assets/images/numbers.gif',
      page: const NumberScreen(),
    ),
    ModelLearn(
      title: 'Learn Alphabet',
      // image: 'assets/images/colors.jpeg',
      image: 'assets/images/fidel.gif',
      page: const FideScreen(),
    ),
    ModelLearn(
      title: 'Learn Fidel',
      // image: 'assets/images/animals.jpg',
      image: 'assets/images/c1.png',
      page: const AmaharicFidel(),
    ),
  ];

  static UnmodifiableListView<ModelLearn> get dataLearn =>
      UnmodifiableListView(_dataLearn);

  static int get dataLength => _dataLearn.length;
}
