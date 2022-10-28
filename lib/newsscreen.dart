import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/carousel.dart';
import 'package:newsapp/constants/colors.dart';
import 'package:newsapp/models/newsmodel.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    super.key,
    required this.category,
    required this.source,
    required this.query,
  });
  final String category;
  final String source;
  final String query;
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Map<dynamic, dynamic> resp = {};
  var newsmodel = NewsModel.empty();

  call() async {
    Map<String, String> head = {
      "Authorization": "a01b989f61e5435fbeb6a3535126aaa0"
    };

    Uri url = Uri();
    if (widget.category != "null") {
      url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=in&category=${widget.category}&pageSize=50");
    } else if (widget.source != "null") {
      url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?sources=${widget.source}&pageSize=50");
    } else {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=${widget.query}&pageSize=50");
    }

    var response = await http.get(url, headers: head);
    newsmodel = NewsModel.fromJson(response.body);
    log(newsmodel.articles.first.url);
    setState(() {
      resp = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ConstColors.primarytext, //change your color here
        ),
        backgroundColor: ConstColors.primaryc,
        title: const Padding(
          padding: EdgeInsets.only(right: 60),
          child: Center(
            child: Text(
              "News",
              style: TextStyle(color: ConstColors.primarytext),
            ),
          ),
        ),
      ),
      body: NewsSlider(
        newsmodel: newsmodel,
      ),
    );
  }
}
