import 'package:flutter/material.dart';

class ScreenRowAlphabet extends StatelessWidget {
  //
  final Image image1;
  final Image image2;

  // // btn
  final Function() onpressedBtn1;
  final Function() onpressedBtn2;

  const ScreenRowAlphabet({super.key, 
    le2,
    required this.onpressedBtn1,
    required this.onpressedBtn2,
    required this.image1,
    required this.image2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenBtnAlphabet(
          onpressedBtn: onpressedBtn1,
          image: image1,
        ),
        const SizedBox(
          width: 10,
        ),
        ScreenBtnAlphabet(
          onpressedBtn: onpressedBtn2,
          image: image2,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

//////////////////////////////////////////////
// ignore: must_be_immutable
class ScreenBtnAlphabet extends StatelessWidget {
  Image image;
  final Function() onpressedBtn;
  ScreenBtnAlphabet({super.key, required this.image, required this.onpressedBtn});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpressedBtn,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.orange[100],
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            padding: const EdgeInsets.all(8),
            minimumSize: const Size(100, 100)),
        child: image,
        //child: Text(title)
      ),
    );
  }
}
