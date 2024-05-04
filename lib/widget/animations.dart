import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:ctracker/view/view_welcome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
     Column(
        children: [
          SizedBox(
            width: 100, // largura da imagem de animação
            height: 100, // altura da imagem de animação
            child: LottieBuilder.asset(
              "assets/images/lottie/trofeupiscando.json"             
              ),
          )
        ],
     ), nextScreen: ViewLogin(),
     splashIconSize: 100,
        backgroundColor: AppColor.backgroundColor,
     );
  }
}