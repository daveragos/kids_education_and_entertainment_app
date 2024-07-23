import 'package:flutter/material.dart';

class PageStory extends StatelessWidget {
  const PageStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Story Page')),
      body: const Center(child: Text('This is the Story Page')),
    );
  }
}
