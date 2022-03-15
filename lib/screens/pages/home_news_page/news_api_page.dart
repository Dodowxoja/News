import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home/models/news_model.dart';
import 'package:home/screens/pages/home_news_page/news_api_connection_page.dart';

class NewsApiPage extends StatefulWidget {
  NewsApiPage(
      {required this.future,
      required this.box,
      required this.newsTabName,
      Key? key})
      : super(key: key);
  Future<NewsModel> future;
  Box<Article> box;
  String newsTabName;
  @override
  State<NewsApiPage> createState() => _NewsApiPageState();
}

class _NewsApiPageState extends State<NewsApiPage> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  bool isConnected = true;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return isConnected
        ? FutureBuilder(
            future: widget.future,
            builder: (_, AsyncSnapshot<NewsModel> snap) {
              if (!snap.hasData) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (snap.hasError) {
                return const Center(child: Text('Error'));
              } else {
                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, __) {
                            return FadeInLeftBig(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 140,
                                          width: 137,
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/gifs/loading.gif',
                                            image: snap.data!.articles![__]
                                                    .urlToImage ??
                                                'https://source.unsplash.com/random',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          height: 166,
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
                                                    snap.data!.articles![__]
                                                        .title
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    snap.data!.articles![__]
                                                            .author ??
                                                        'Dodow',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(widget.newsTabName),
                                                  const CircleAvatar(
                                                    radius: 3,
                                                    backgroundColor:
                                                        Colors.grey,
                                                  ),
                                                  Text(
                                                    snap.data!.articles![__]
                                                            .publishedAt!
                                                            .toString()
                                                            .substring(10, 16) +
                                                        'hr ago',
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.more_horiz),
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
                              ),
                            );
                          },
                          itemCount: snap.data!.articles!.length,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          )
        : NewsApiConnectionPage(
            box: widget.box,
            newsTabName: widget.newsTabName,
          );
  }

  checkConnection() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        //widget.future;
        isConnected = true;
        setState(() {});
      } else {
        isConnected = false;
        setState(() {});
      }
    });
  }
}
