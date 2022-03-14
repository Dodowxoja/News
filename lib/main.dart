import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/models/news_model.dart';
import 'package:home/routes/my_route.dart';
// import 'package:home/service/api_service.dart';
import 'package:home/service/apple_api_service.dart';
import 'package:home/service/business_api_service.dart';
import 'package:home/service/tech_api_service.dart';
import 'package:home/service/tesla_api_service.dart';
import 'package:home/service/wsj_api_service.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());

  await AppleApiService.openBox();
  await TeslaApiService.openBox();
  await BusinessApiService.openBox();
  await TechApiService.openBox();
  await WsjApiService.openBox();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute myRoute = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: myRoute.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
