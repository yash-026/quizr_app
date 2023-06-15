import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizr/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HomeScreen()
          )
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    // const colorizeTextStyle = TextStyle(
    //   fontSize: 50.0,
    //   fontWeight: FontWeight.w800,
    // );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              totalRepeatCount: 3,
              isRepeatingAnimation: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'QUIZR',
                    textStyle: GoogleFonts.exo2(fontWeight: FontWeight.bold, fontSize: 50.0),
                    colors: colorizeColors,
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}
