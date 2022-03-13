import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/routes/my_route.dart';
import 'package:home/service/api_service.dart';

void main() async {
  await Hive.initFlutter();
  ApiService.registerAdapter();
  await ApiService.openBox();
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
