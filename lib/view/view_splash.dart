import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/main.dart'; // Importar a Root
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child:
                LottieBuilder.asset("assets/images/lottie/trofeupiscando.json"),
          )
        ],
      ),
      nextScreen: const Root(),
      splashIconSize: 100,
      backgroundColor: AppColor.backgroundColor,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
