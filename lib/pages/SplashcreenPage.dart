
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashcreenPage extends StatelessWidget {
  const SplashcreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              Lottie.asset("asset/home.json",),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 2),
                  child: Text(
                    "Yinzo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     // Adjust text color
                    ),
                  ),
                ),
              ),
            ],
          )
      )
    );
  }
}
    