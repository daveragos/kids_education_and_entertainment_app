import 'package:flutter/material.dart';

class PageApps extends StatelessWidget {
  const PageApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps Page'),
      ),
      body: const Center(
        child: Text('This is the Apps Page'),
      ),
    );
  }
}
