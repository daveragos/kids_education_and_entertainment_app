import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarSimple({super.key, this.title = "kid's education and entertainment"});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: GoogleFonts.elMessiri(
            fontStyle: FontStyle.italic,
            fontSize: 30,
            shadows: [
              const Shadow(
                offset: Offset(1.5, 1.5),
                color: Colors.blue,
                blurRadius: 3,
              )
            ]),
      ),
      centerTitle: true,
      actions: const [
        //app icon
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/logo/rocket.png"),
            radius: 25,
          ),
        )
      ],
      //leading: Icon(Icons.menu, color: Colors.black),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
