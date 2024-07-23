import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';
import 'home_page.dart'; // Make sure you have this file created for your home page

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // GIF Background

          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: const AssetImage('assets/images/first_page.gif'),
            fit: BoxFit.cover,
          ),
          // Play Button
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 107, 228, 181),
                      const Color.fromARGB(255, 165, 202, 231)
                    ], // Gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      50.0), // BorderRadius to create an oval shape
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 40.0), // Padding to make the button larger
                child: SvgPicture.asset(
                  'assets/images/play-button.svg',
                  width: 60.0,
                  height: 60.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
