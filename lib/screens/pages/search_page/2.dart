import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/models/news_model.dart';

class SecondPage extends StatelessWidget {
  Article? news;
  SecondPage({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/icons/title.svg'),
              ),
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(
                            news!.urlToImage.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        news!.title.toString(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random")),
                      title: Text(news!.author.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(15.0),
                        child: Text(news!.description.toString()))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
