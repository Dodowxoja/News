import 'dart:io';
import 'package:dio/dio.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  static Box<Article>? myBox1;
  static Box<Article>? myBox2;
  static Box<Article>? myBox3;
  static Box<Article>? myBox4;
  static Box<Article>? myBox5;
  static Future<NewsModel> getData(httpsApi) async {
    await openBox();
    Response res = await Dio().get(httpsApi);
    await putData(NewsModel.fromJson(res.data));
    return NewsModel.fromJson(res.data);
  }

  static registerAdapter() {
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(SourceAdapter());
  }

  static openBox() async {
    myBox1 = await Hive.openBox('box1');
    myBox2 = await Hive.openBox('box2');
    myBox3 = await Hive.openBox('box3');
    myBox4 = await Hive.openBox('box4');
    myBox5 = await Hive.openBox('box5');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(NewsModel data) async {
    myBox1!.clear();
    myBox2!.clear();
    myBox3!.clear();
    myBox4!.clear();
    myBox5!.clear();
    for (var item in data.articles!) {
      myBox1!.add(item);
    }
    for (var item in data.articles!) {
      myBox2!.add(item);
    }
    for (var item in data.articles!) {
      myBox3!.add(item);
    }
    for (var item in data.articles!) {
      myBox4!.add(item);
    }
    for (var item in data.articles!) {
      myBox5!.add(item);
    }
  }
}
