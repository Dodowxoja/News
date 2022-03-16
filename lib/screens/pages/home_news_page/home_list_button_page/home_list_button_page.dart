import 'package:flutter/material.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/models/news_model.dart';
import 'package:home/widgets/others_widget.dart';

class HomeListButtonPage extends StatefulWidget {
  Article data;
  String newsTabName;
  HomeListButtonPage({required this.newsTabName, required this.data, Key? key})
      : super(key: key);

  @override
  State<HomeListButtonPage> createState() => _HomeListButtonPageState();
}

class _HomeListButtonPageState extends State<HomeListButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [Text('Icons'), Text('Icons')]),
      body: Column(
        children: [
          SizedBox(
            height: 229,
            width: double.infinity,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/gifs/loading.gif',
              image: widget.data.urlToImage.toString(),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.description.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                              radius: 26.5,
                              backgroundImage: NetworkImage(
                                  'https://source.unsplash.com/random')),
                          Text(
                            "By ${widget.data.author}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13,
                              color: ColorConst.color2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                        "${widget.data.publishedAt.toString().substring(10, 16)} ago")
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 296,
                  height: 23,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OthersWidget.others(
                          Icons.mode_comment_outlined, 'commnets',
                          numbers: ' 8 '),
                      OthersWidget.others(Icons.favorite_border, 'likes',
                          numbers: ' 34 '),
                      OthersWidget.others(Icons.share, ' Share'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  widget.data.content.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
