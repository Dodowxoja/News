import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:home/models/news_model.dart';
import 'package:home/screens/pages/home_news_page/news_api_connection_page.dart';

class NewsApiPage extends StatefulWidget {
  NewsApiPage({required this.future, Key? key}) : super(key: key);
  Future<NewsModel>? future;
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

  checkConnection() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        isConnected = true;
        setState(() {});
      } else {
        isConnected = false;
        setState(() {});
      }
    });
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
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 140,
                                        width: 137,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snap.data!.articles![__]
                                                      .urlToImage ??
                                                  'https://source.unsplash.com/random',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
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
                                                  snap.data!.articles![__].title
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
                                                const Text('Apple'),
                                                const CircleAvatar(
                                                  radius: 3,
                                                  backgroundColor: Colors.grey,
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
        : const NewsApiConnectionPage();
  }
}
