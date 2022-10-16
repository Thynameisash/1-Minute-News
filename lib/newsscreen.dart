import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/carousel.dart';
import 'package:newsapp/models/newsmodel.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    super.key,
    required this.category,
    required this.source,
  });
  final String category;
  final String source;
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
    if (widget.source == "null") {
      url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=in&category=${widget.category}&pageSize=50");
    } else {
      url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?sources=${widget.source}&pageSize=50");
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
        backgroundColor: const Color(0xff5072a7),
        title: const Padding(
          padding: EdgeInsets.only(right: 60),
          child: Center(
            child: Text("News"),
          ),
        ),
      ),
      body: NewsSlider(
        newsmodel: newsmodel,
      ),
    );
  }
}
