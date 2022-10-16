import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsmodel.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({super.key, required this.newsmodel});
  final NewsModel newsmodel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    log(newsmodel.articles.length.toString());
    return ColoredBox(
      color: Colors.black,
      child: CarouselSlider(
        options: CarouselOptions(
          // autoPlay: false,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,

          height: height * 1,
          viewportFraction: 1,
        ),
        items: newsmodel.articles.map((singlearticle) {
          return singlearticle.urlToImage == "null"
              ? const Offstage()
              : Material(
                  color: const Color(0xff1c2841),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.4,
                        child: Image.network(
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://www.northampton.ac.uk/wp-content/uploads/2018/11/default-svp_news.jpg",
                              fit: BoxFit.cover,
                            );
                          },
                          singlearticle.urlToImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          singlearticle.title,
                          style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Text(
                          "${singlearticle.description} \n${singlearticle.content}",
                          style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 246, 246, 246),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: SizedBox(
                          child: Text(
                            "Source : ${singlearticle.source.name}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   child: Stack(
                      //     children: [Text(singlearticle.title)],
                      //   ),
                      // )
                    ],
                  ),
                );
        }).toList(),
      ),
    );
  }
}
