import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:todo/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Column(
        // crossAxisAlignment: Space,
        children: <Widget> [
          Image(
              image: AssetImage("assets/images/sapiens.png"),
              width: 280,
            ),
          Text(
            "To Do App",
            style: TextStyle(
              fontSize: 36
            ),
          )
        ],
      ),
      duration: 2500,
      backgroundColor: Colors.lightBlue,
      splashIconSize: 300,
      nextScreen: const HomePage(),
    );
  }
}
