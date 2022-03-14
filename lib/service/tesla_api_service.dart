import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class TeslaApiService {
  static List myAllOnlineData = [];
  static Box<Article>? myBox2;

  static Future<NewsModel> getData() async {
    await openBox();
    Response res = await Dio().get(ApiHttpsConst.httpsApis3[1]);
    await putData(NewsModel.fromJson(res.data));
    return NewsModel.fromJson(res.data);
  }

  static registerAdapter() {
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(SourceAdapter());
  }

  static openBox() async {
    myBox2 = await Hive.openBox('box2');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(NewsModel data) async {
    myBox2!.clear();

    for (var item in data.articles!) {
      myBox2!.add(item);
    }
  }
}
