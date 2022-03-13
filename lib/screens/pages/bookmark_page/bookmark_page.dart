import 'package:flutter/material.dart';
import 'package:home/core/constants/color_const.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage>
    with TickerProviderStateMixin {
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
        centerTitle: false,
        title: const Text('data'),
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
      body: const SizedBox(),
    );
  }
}
