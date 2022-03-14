import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/models/news_model.dart';
import 'package:home/screens/pages/search_page/2.dart';
import 'package:home/service/apple_api_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Future<List<NewsModel>>> dataApi = [
    // AppleApiService.getData(),
    // AppleApiService.getData(),
    // AppleApiService.getData(),
    // AppleApiService.getData(),
    // AppleApiService.getData(),
  ];

  TextEditingController textController = TextEditingController();

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/title.svg'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          child: CupertinoSearchTextField(),
        ),
        Expanded(
          flex: 8,
          child: FutureBuilder(
            future: AppleApiService.getData(),
            builder: (context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snap.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                var data = snap.data;
                return ListView.builder(
                  itemBuilder: (ctx, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data!
                                          .articles![i].urlToImage
                                          .toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 270,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.articles![i].title.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 220,
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(data
                                                      .articles![i].source!.name
                                                      .toString()),
                                                  const Icon(Icons.more_horiz),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => SecondPage(
                                news: data.articles![i],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: data!.articles!.length,
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
