// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:home/models/news_model.dart';
import 'package:home/screens/home/my_home_page.dart';
import 'package:home/screens/pages/home_news_page/home_list_button_page/home_list_button_page.dart';
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
      case '/list_home':
        return MaterialPageRoute(
          builder: (_) => HomeListButtonPage(
            article: (args as List)[0] as Article,
            newsTabName: (args as List)[1].toString(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text('404')));
    }
  }
}
