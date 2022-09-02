import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_student_record/login.dart';

// ignore_for_file: prefer_const_constructors
class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: imagesplash(),
      nextScreen: LoginScreen(),
    );
  }
//splash screen image function
  imagesplash() {
    Image(
      image: AssetImage('assets/images/mg-logo.png'),
    );
  }
//end of splash screen logo
}
