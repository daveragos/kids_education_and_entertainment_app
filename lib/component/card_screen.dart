import 'package:flutter/material.dart';

class ScreenRow extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;

  final Color btnColor1;
  final Color btnColor2;
  final Color btnColor3;

  final Function() onpressedBtn1;
  final Function() onpressedBtn2;
  final Function() onpressedBtn3;

  const ScreenRow({super.key, 
    required this.title1,
    required this.title2,
    required this.title3,
    required this.onpressedBtn1,
    required this.onpressedBtn2,
    required this.onpressedBtn3,
    this.btnColor1 = Colors.deepOrangeAccent,
    this.btnColor2 = Colors.orange,
    this.btnColor3 = Colors.deepOrange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenBtn(
          onpressedBtn: onpressedBtn1,
          btncolor: btnColor1,
          title: title1,
        ),
        const SizedBox(
          width: 10,
        ),
        ScreenBtn(
          onpressedBtn: onpressedBtn2,
          btncolor: btnColor2,
          title: title2,
        ),
        const SizedBox(
          width: 10,
        ),
        ScreenBtn(
          onpressedBtn: onpressedBtn3,
          btncolor: btnColor3,
          title: title3,
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////
// ignore: must_be_immutable
class ScreenBtn extends StatelessWidget {
  Color btncolor;
  String title;
  final Function() onpressedBtn;
  ScreenBtn(
      {super.key, required this.btncolor,
      required this.title,
      required this.onpressedBtn});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: onpressedBtn,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: btncolor,
              elevation: 10,
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              padding: const EdgeInsets.all(8),
              minimumSize: const Size(100, 50)),
          child: Text(title)),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////

class ShowImage extends StatelessWidget {
  final String image;

  const ShowImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          border: Border.all(color: Colors.orange, width: 5),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
    ));
  }
}

// ! Colors
///////////////////////////////////////////////////////////////////////////////
class ScreenRowColor extends StatelessWidget {
  final Color btnColor1;
  final Color btnColor2;

  final Image image1;
  final Image image2;

  final Function() onpressedBtn1;
  final Function() onpressedBtn2;

  const ScreenRowColor({super.key, 
    required this.onpressedBtn1,
    required this.onpressedBtn2,
    required this.image1,
    required this.image2,
    this.btnColor1 = Colors.deepOrangeAccent,
    this.btnColor2 = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenBtnColors(
          onpressedBtn: onpressedBtn1,
          btncolor: btnColor1,
          image: image1,
        ),
        const SizedBox(
          width: 10,
        ),
        ScreenBtnColors(
          onpressedBtn: onpressedBtn2,
          btncolor: btnColor2,
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
class ScreenBtnColors extends StatelessWidget {
  Color btncolor;

  Image image;
  final Function() onpressedBtn;
  ScreenBtnColors(
      {super.key, required this.btncolor,
      required this.image,
      required this.onpressedBtn});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpressedBtn,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: btncolor,
            elevation: 10,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            padding: const EdgeInsets.all(8),
            minimumSize: const Size(100, 100)),
        child: image,
      ),
    );
  }
}
