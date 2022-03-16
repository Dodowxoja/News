import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/screens/pages/search_page/search_list_page.dart';
import 'package:home/service/apple_api_service.dart';
import 'package:home/service/business_api_service.dart';
import 'package:home/service/tech_api_service.dart';
import 'package:home/service/tesla_api_service.dart';
import 'package:home/service/wsj_api_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
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
        title: const Text('Search', style: TextStyle(color: Colors.black)),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/title.svg'),
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
                SearchListPage(
                  future: AppleApiService.getData(),
                  newsTabName: 'Apple',
                ),
                SearchListPage(
                  future: TeslaApiService.getData(),
                  newsTabName: 'Tesla',
                ),
                SearchListPage(
                  future: BusinessApiService.getData(),
                  newsTabName: 'Business',
                ),
                SearchListPage(
                  future: TechApiService.getData(),
                  newsTabName: 'TechCrunch',
                ),
                SearchListPage(
                  future: WsjApiService.getData(),
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
  void dispose() async {
    super.dispose();
    await connectivitySubscription!.cancel();
  }
}
