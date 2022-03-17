// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/models/news_model.dart';
import 'package:home/service/apple_api_service.dart';

class NewsApiConnectionPage extends StatefulWidget {
  NewsApiConnectionPage(
      {required this.box, required this.newsTabName, Key? key})
      : super(key: key);
  Box<Article> box;
  String newsTabName;

  @override
  State<NewsApiConnectionPage> createState() => _NewsApiConnectionPageState();
}

class _NewsApiConnectionPageState extends State<NewsApiConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return AppleApiService.myBox1!.isNotEmpty
        ? Column(
            children: [
              SizedBox(
                height: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Connecting..."),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator.adaptive(strokeWidth: 1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, __) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 140,
                                width: 137,
                                color: Colors.grey.shade200,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Connecting Image',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 148,
                                width: 232.4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.box.getAt(__)!.title ??
                                              "Xo'ja",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          widget.box.getAt(__)!.author ??
                                              'Dodow',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.newsTabName,
                                          style: TextStyle(
                                              color: ColorConst.color5),
                                        ),
                                        const CircleAvatar(
                                          radius: 3,
                                          backgroundColor: Colors.grey,
                                        ),
                                        Text(widget.box
                                                .getAt(__)!
                                                .publishedAt
                                                .toString()
                                                .substring(10, 16) +
                                            'hr ago'),
                                        IconButton(
                                          icon: const Icon(Icons.more_horiz),
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: widget.box.length,
                ),
              ),
            ],
          )
        : const Center(child: Text('Please check your connection'));
  }
}
