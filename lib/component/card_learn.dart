import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_education_and_entertainment_app/Model/m_learn.dart';

class CardLearn extends StatelessWidget {
  final ModelLearn data;
  final String title;
  final Widget screen;

  const CardLearn({
    super.key, // Added Key parameter
    required this.data,
    required this.title,
    required this.screen,
  }); // Pass Key to the superclass

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigate(context, screen);
      },
      child: SizedBox(
        width: 180, // Fixed width for horizontal scroll
        // height: 50,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          elevation: 05,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  data.image,
                  fit: BoxFit.cover, // Make image cover the entire container
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  data.title,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.yellow, // White text for contrast
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    backgroundColor:
                        Colors.black54, // Slightly transparent background
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
