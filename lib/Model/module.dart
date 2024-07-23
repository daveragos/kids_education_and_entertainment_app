import 'package:flutter/material.dart';
//import 'package:kids_education_and_entertainment_app/model/m_learn.dart';

class Module {
  final String name;
  final String description;
  final String thumbnailPath;
  final MaterialPageRoute route;
  Color backgroundColor;

  Module({
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.route,
    required this.backgroundColor,
  });
}
