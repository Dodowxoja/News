import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<String> searchedItems = {};
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
                // onChanged: (v) {
                //   searchedItems.clear();
                //   // for (var item in dataApi) {
                //     if (v.length == 0) {
                //       // searchedItems.clear();
                //       // setState(() {});
                //     // } else if (item['author']
                //       //   .toString()
                //       //   .toLowerCase()
                //       //   .contains(v.toString().toLowerCase())) {
                //       // searchedItems.add(item['author']);
                //       // setState(() {});
                //     }
                //   }
                // },
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 140,
                              width: 137,
                              decoration: BoxDecoration(
                                  // image: DecorationImage(
                                  //   // image: NetworkImage(
                                  //   //   // dataApi[__].articles![__].urlToImage ??
                                  //   //   //     'https://source.unsplash.com/random',
                                  //   // ),
                                  //   fit: BoxFit.cover,
                                  // ),
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
                                      // Text(
                                      //   // dataApi[__]
                                      //   //     .articles![__]
                                      //   //     .title
                                      //   //     .toString(),
                                      //   textAlign: TextAlign.start,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   maxLines: 4,
                                      // ),
                                      // const SizedBox(height: 10),
                                      // Text(
                                      //   dataApi[__].articles![__].author ??
                                      //       'Dodow',
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(dataApi[__]),
                                      // const CircleAvatar(
                                      //   radius: 3,
                                      //   backgroundColor: Colors.grey,
                                      // ),
                                      // Text(
                                      //   dataApi[__]
                                      //           .articles![__]
                                      //           .publishedAt!
                                      //           .toString()
                                      //           .substring(10, 16) +
                                      //       'hr ago',
                                      // ),
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
                // itemCount: dataApi.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
