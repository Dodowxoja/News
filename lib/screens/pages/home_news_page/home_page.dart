import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/screens/pages/home_news_page/news_api_page.dart';
import 'package:home/service/apple_api_service.dart';
import 'package:home/service/business_api_service.dart';
import 'package:home/service/tech_api_service.dart';
import 'package:home/service/tesla_api_service.dart';
import 'package:home/service/wsj_api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/title.svg'),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/notification_black.svg'),
            ),
          ),
        ],
        bottom: TabBar(
          indicatorWeight: 0,
          automaticIndicatorColorAdjustment: false,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          isScrollable: true,
          indicator: ShapeDecoration(
            color: ColorConst.color,
            shape: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          controller: _tabController,
          tabs: const [
            Tab(text: 'Apple'),
            Tab(text: 'Tesla'),
            Tab(text: 'Business'),
            Tab(text: 'TechCrunch'),
            Tab(text: 'Wall Street Journal')
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                NewsApiPage(
                  future: AppleApiService.getData(),
                  box: AppleApiService.myBox1!,
                  newsTabName: 'Apple',
                ),
                NewsApiPage(
                  future: TeslaApiService.getData(),
                  box: TeslaApiService.myBox2!,
                  newsTabName: 'Tesla',
                ),
                NewsApiPage(
                  future: BusinessApiService.getData(),
                  box: BusinessApiService.myBox3!,
                  newsTabName: 'Business',
                ),
                NewsApiPage(
                  future: TechApiService.getData(),
                  box: TechApiService.myBox4!,
                  newsTabName: 'Tech',
                ),
                NewsApiPage(
                  future: WsjApiService.getData(),
                  box: WsjApiService.myBox5!,
                  newsTabName: 'WSJ',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubscription!.cancel();
  }
}
