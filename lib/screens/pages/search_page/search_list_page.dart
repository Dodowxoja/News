import 'package:flutter/material.dart';
import 'package:home/models/news_model.dart';

class SearchListPage extends StatefulWidget {
  SearchListPage({required this.future, required this.newsTabName, Key? key})
      : super(key: key);
  Future<NewsModel> future;

  String newsTabName;

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  List<Article> searchedItems = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: widget.future,
          builder: (_, AsyncSnapshot<NewsModel> snap) {
            if (!snap.hasData) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snap.hasError) {
              return const Center(child: Text('Error'));
            } else {
              var data = snap.data;
              return Column(
                children: [
                  const SizedBox(height: 22),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        scrollController: ScrollController(),
                        controller: _textController,
                        decoration: InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.center,
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
                          for (var i = 0; i < data!.articles!.length; i++) {
                            if (v.length == 0) {
                              searchedItems.clear();
                              setState(() {});
                            } else if (data.articles![i].author
                                .toString()
                                .toLowerCase()
                                .contains(v.toString().toLowerCase())) {
                              searchedItems.add(data.articles![i]);
                              setState(() {});
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
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
                                            searchedItems[__].urlToImage ??
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
                                                searchedItems[__]
                                                    .title
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                searchedItems[__]
                                                        // .articles![__]
                                                        .author ??
                                                    'Dodow',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(widget.newsTabName),
                                              const CircleAvatar(
                                                radius: 3,
                                                backgroundColor: Colors.grey,
                                              ),
                                              Text(
                                                searchedItems[__]
                                                        // .articles![__]
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
                        itemCount: searchedItems.length,
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
