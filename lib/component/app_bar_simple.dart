import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  // Named parameter for title with a default value
  const AppBarSimple({super.key, this.title = 'አ ቦ ጊ ዳ'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.chewy(
              fontSize: 26,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          // const SizedBox(width: 10),
          // Image.asset(
          //   "assets/images/play-button.png",
          //   height: 40,
          //   width: 40,
          // ),
        ],
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Image.asset(
            "assets/images/logo.png",
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
