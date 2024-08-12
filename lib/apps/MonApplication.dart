import 'package:flutter/material.dart';
import 'package:makao_test/pages/BottomNav.dart';
import 'package:makao_test/pages/LoginPage.dart';
import 'package:makao_test/pages/ProfilePage.dart';
import 'package:makao_test/pages/RegisterPage.dart';
import 'package:makao_test/pages/SplashcreenPage.dart';

import '../pages/OnboardingPage.dart';

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
