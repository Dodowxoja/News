// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:home/core/constants/api_https_const.dart';
import 'package:home/models/news_model.dart';
import 'package:home/service/api_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Future<NewsModel>> dataApi = [
    ApiService.getData(ApiHttpsConst.httpsApis2[0]),
    ApiService.getData(ApiHttpsConst.httpsApis2[1]),
    ApiService.getData(ApiHttpsConst.httpsApis2[2]),
    ApiService.getData(ApiHttpsConst.httpsApis2[3]),
    ApiService.getData(ApiHttpsConst.httpsApis2[4]),
  ];

  List<Future<NewsModel>> searchedItems = [];
  final TextEditingController _textController = TextEditingController();

  List<NewsModel> _foundUsers = [];
  @override
  initState() {
    _foundUsers = dataApi.cast<NewsModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              scrollController: ScrollController(),
              controller: _textController,
              decoration: InputDecoration(
                fillColor: const Color(0xffEEEEEE),
                hintText: "Search",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _textController.text = '';
                    setState(() {});
                  },
                ),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onTap: () {},
              onChanged: (v) {
                searchedItems.clear();
                for (var item in dataApi) {
                  if (v.length == 0) {
                    searchedItems.clear();
                    setState(() {});
                  } else if (item.toString().toLowerCase().contains(
                        v.toString().toLowerCase(),
                      )) {
                    searchedItems.add(item);
                    setState(() {});
                  }
                }
              },
            ),
          ),
          SizedBox(
            child: FutureBuilder(
              future: Future.wait(searchedItems),
              builder: (_, AsyncSnapshot<List<NewsModel>> snap) {
                if (!snap.hasData) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                } else if (snap.hasError) {
                  return const Center(child: Text('Error'));
                } else {
                  return SafeArea(
                    child: SizedBox(
                      child: ListView.builder(
                        itemBuilder: (_, __) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 137,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snap.data![__].articles![__]
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
                                                snap.data![__].articles![__]
                                                    .title
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                snap.data![__].articles![__]
                                                        .author ??
                                                    'Dodow',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Apple'),
                                              const CircleAvatar(
                                                radius: 3,
                                                backgroundColor: Colors.grey,
                                              ),
                                              Text(
                                                snap.data![__].articles![__]
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
                        itemCount: snap.data!.length,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
