import 'package:flutter/material.dart';
import 'package:makao_test/pages/AccountTypePage.dart';
import 'package:makao_test/pages/LoginPage.dart';
import 'package:makao_test/pages/OnboardingPage.dart';
import 'package:makao_test/pages/PreferencePage.dart';
import 'package:makao_test/pages/RegisterPage.dart';
import 'package:makao_test/pages/SplashcreenPage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.onbordingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
        case Routes.logInRoute:
      return MaterialPageRoute(builder: (_)=>LoginPage());
      case Routes.signUpRoute:
        final int? accountTypeId = r.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => RegisterPage(accountTypeId: accountTypeId),
        );
      case Routes.accountTypeRoute:
        return MaterialPageRoute(builder: (_)=>AccountTypePage());
      case Routes.preferenceRoute:
        return MaterialPageRoute(builder: (_)=>Preferencepage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_)=>BottomAppBar());
      default:
        return MaterialPageRoute(builder: (_) =>Splashcreenpage());
    }
  }
}
