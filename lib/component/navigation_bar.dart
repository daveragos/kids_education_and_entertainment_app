import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int indexpage;
  final Function(int) onClock;
  const CustomNavigationBar({super.key, required this.indexpage, required this.onClock});
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.orange.shade600,
      backgroundColor: Colors.white,
      items: const [
        Icon(
          Icons.auto_awesome,
          color: Colors.black,
          size: 24,
        ),
        Icon(
          Icons.ondemand_video_rounded,
          color: Colors.black,
          size: 24,
        ),
        Icon(
          Icons.auto_stories,
          color: Colors.black,
          size: 24,
        ),
        Icon(
          Icons.now_widgets,
          color: Colors.black,
          size: 24,
        ),
      ],
      onTap: onClock,
    );
  }
}
