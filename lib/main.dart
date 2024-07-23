import 'package:error_stack/error_stack.dart';
import 'package:flutter/material.dart';
//import 'package:kids_education_and_entertainment_app/animated_background.dart';
//import 'package:kids_education_and_entertainment_app/component/app_bar_simple.dart';
//import 'package:kids_education_and_entertainment_app/component/navigation_bar.dart';
//import 'package:kids_education_and_entertainment_app/views/login_page.dart';
import 'package:kids_education_and_entertainment_app/views/login_page.dart';
//import 'package:kids_education_and_entertainment_app/views/number_screen.dart';
//import 'package:kids_education_and_entertainment_app/views/alphabet_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ErrorStack.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}
