import 'package:flutter/material.dart';

class ScreenRowGeezNumbet extends StatelessWidget {
  final Image image1;
  final Image image2;
  final Function() onpressedBtn1;
  final Function() onpressedBtn2;

  const ScreenRowGeezNumbet({super.key, 
    required this.onpressedBtn1,
    required this.onpressedBtn2,
    required this.image1,
    required this.image2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenBtnGeezNumbet(
          onpressedBtn: onpressedBtn1,
          image: image1,
        ),
        const SizedBox(width: 5),
        ScreenBtnGeezNumbet(
          onpressedBtn: onpressedBtn2,
          image: image2,
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class ScreenBtnGeezNumbet extends StatelessWidget {
  final Image image;
  final Function() onpressedBtn;

  const ScreenBtnGeezNumbet({super.key, required this.image, required this.onpressedBtn});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpressedBtn,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange[100],
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          padding: const EdgeInsets.all(4),
          minimumSize: const Size(50, 50),
        ),
        child: image,
      ),
    );
  }
}
