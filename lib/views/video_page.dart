import 'package:flutter/material.dart';

class PageVideo extends StatelessWidget {
  const PageVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Page'),
      ),
      body: const Center(
        child: Text('This is the Video Page'),
      ),
    );
  }
}
