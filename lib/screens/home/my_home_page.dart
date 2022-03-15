import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/core/constants/svg_icons.dart';
import 'package:home/screens/pages/bookmark_page/bookmark_page.dart';
import 'package:home/screens/pages/home_news_page/home_page.dart';
import 'package:home/screens/pages/search_page/serach_page.dart';
import 'package:home/screens/pages/setting_page/setting_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List _pages = const [
    HomePage(),
    SearchPage(),
    // SearchListPage(),
    BookMarkPage(),
    SettingPage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset(MyHomePageIcons.iconSvgBlack[0].toString())
                  : SvgPicture.asset(
                      MyHomePageIcons.iconSvgWhite[0].toString()),
              label: ''),
          BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset(MyHomePageIcons.iconSvgBlack[1].toString())
                  : SvgPicture.asset(
                      MyHomePageIcons.iconSvgWhite[1].toString()),
              label: ''),
          BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset(MyHomePageIcons.iconSvgBlack[2].toString())
                  : SvgPicture.asset(
                      MyHomePageIcons.iconSvgWhite[2].toString()),
              label: ''),
          BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset(MyHomePageIcons.iconSvgBlack[3].toString())
                  : SvgPicture.asset(
                      MyHomePageIcons.iconSvgWhite[3].toString()),
              label: ''),
        ],
        onTap: (v) {
          _currentIndex = v.toInt();
          setState(() {});
        },
      ),
    );
  }
}
