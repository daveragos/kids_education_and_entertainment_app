import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  Color _backgroundColor = Colors.blue;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startBackgroundColorAnimation();
  }

  void _startBackgroundColorAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _backgroundColor = _backgroundColor == Colors.blue
            ? Colors.green
            : Colors.blue;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      color: _backgroundColor,
      child: widget.child,
    );
  }
}
