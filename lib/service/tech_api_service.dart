import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

class TechApiService {
  static List myAllOnlineData = [];
  static Box<Article>? myBox4;

  static Future<NewsModel> getData() async {
    await openBox();
    Response res = await Dio().get(ApiHttpsConst.httpsApis3[3]);
    await putData(NewsModel.fromJson(res.data));
    return NewsModel.fromJson(res.data);
  }

  static registerAdapter() {
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(SourceAdapter());
  }

  static openBox() async {
    myBox4 = await Hive.openBox('box4');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(NewsModel data) async {
    await myBox4!.clear();
    for (var item in data.articles!) {
      myBox4!.add(item);
    }
  }
}

// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

//Future<List<NewsModel>>

// try {
  //   await openBox();
  //   Response res = await Dio().get(httpsApi);
  //   await putData(NewsModel.fromJson(res.data));
  //   return NewsModel.fromJson(res.data);
  // } catch (e) {
  //   Exception(e);
  //   return NewsModel();
  // }

// List<NewsModel> allData =
  // (res.data as List).map((e) => NewsModel.fromJson(e)).toList();

  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // Hive.init(appDocDir.path);
