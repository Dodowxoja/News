import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class BusinessApiService {
  static List myAllOnlineData = [];
  static Box<Article>? myBox3;

  static Future<NewsModel> getData() async {
    await openBox();
    Response res = await Dio().get(ApiHttpsConst.httpsApis3[2]);
    await putData(NewsModel.fromJson(res.data));
    return NewsModel.fromJson(res.data);
  }

  static registerAdapter() {
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(SourceAdapter());
  }

  static openBox() async {
    myBox3 = await Hive.openBox('box3');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(NewsModel data) async {
    myBox3!.clear();
    for (var item in data.articles!) {
      myBox3!.add(item);
    }
  }
}
