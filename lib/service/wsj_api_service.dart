import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class WsjApiService {
  static List myAllOnlineData = [];
  static Box<Article>? myBox5;

  static Future<NewsModel> getData() async {
    await openBox();
    Response res = await Dio().get(ApiHttpsConst.httpsApis1[4]);
    await putData(NewsModel.fromJson(res.data));
    return NewsModel.fromJson(res.data);
  }

  static registerAdapter() {
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(SourceAdapter());
  }

  static openBox() async {
    myBox5 = await Hive.openBox('box5');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(NewsModel data) async {
    await myBox5!.clear();
    for (var item in data.articles!) {
      myBox5!.add(item);
    }
  }
}
