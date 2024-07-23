// lib/component/item.dart
//import 'package:flutter_tts/flutter_tts.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:kids_education_and_entertainment_app/Controller/c_screenl.dart';
class Item {
  final String title;
  final String description;
  final String iconAsset;
  final Color backgroundColor;
  final LinearGradient backgroundGradient;
  final String? audioPath;

  const Item({
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.backgroundColor,
    required this.backgroundGradient,
    this.audioPath, 
  });
}
