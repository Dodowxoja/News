import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/screens/pages/home_news_page/news_api_page.dart';
import 'package:home/service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
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
      body: TabBarView(
        controller: _tabController,
        children: [
          NewsApiPage(future: ApiService.getData(ApiHttpsConst.httpsApis2[0])),
          NewsApiPage(future: ApiService.getData(ApiHttpsConst.httpsApis2[1])),
          NewsApiPage(future: ApiService.getData(ApiHttpsConst.httpsApis2[2])),
          NewsApiPage(future: ApiService.getData(ApiHttpsConst.httpsApis2[3])),
          NewsApiPage(future: ApiService.getData(ApiHttpsConst.httpsApis2[4])),
        ],
      ),
    );
  }
}
