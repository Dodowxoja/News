import 'package:flutter/material.dart';
import 'package:home/service/api_service.dart';

class NewsApiConnectionPage extends StatefulWidget {
  const NewsApiConnectionPage({Key? key}) : super(key: key);

  @override
  State<NewsApiConnectionPage> createState() => _NewsApiConnectionPageState();
}

class _NewsApiConnectionPageState extends State<NewsApiConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return ApiService.myBox1!.isEmpty
        ? const Center(child: Text('Please check your connection'))
        : Column(
            children: [
              const Text("Connecting"),
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
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(ApiService.myBox1!
                                        .getAt(__)!
                                        // .articles![__]
                                        .urlToImage
                                        .toString()),
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
                                          "${ApiService.myBox1!.getAt(__)!.author}", //.articles![__]
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(ApiService.myBox1!
                                                .getAt(__)!
                                                // .articles![__]
                                                .author ??
                                            'dodow'),
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
                                          ApiService.myBox1!
                                                  .getAt(__)!
                                                  // .articles![__]
                                                  .publishedAt
                                                  .toString()
                                                  .substring(10, 16) +
                                              'hr ago',
                                        ),
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
                  itemCount: ApiService.myBox1!.length,
                ),
              ),
            ],
          );
  }
}
