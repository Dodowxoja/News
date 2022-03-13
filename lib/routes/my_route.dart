import 'package:flutter/material.dart';
import 'package:home/screens/home/my_home_page.dart';
import 'package:home/screens/pages/home_news_page/home_page.dart';
import 'package:home/screens/sign_in/sign_in_page.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
