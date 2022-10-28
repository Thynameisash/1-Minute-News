import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/constants/colors.dart';
import 'package:newsapp/models/newsmodel.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({super.key, required this.newsmodel});
  final NewsModel newsmodel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    addinfo(singlearticle) {
      // return users
      //     .add({
      //       "news": singlearticle,
      //     })
      //     .then(
      //       (value) => print("Info Added:\n${value}"),
      //     )
      //     .catchError(
      //       (error) => print("Failed to add user: $error"),
      //     );
    }

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
                  color: ConstColors.primaryc,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Source : ${singlearticle.source.name}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => {addinfo(singlearticle.url)},
                                    child: const Text(
                                      "Add to favs",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(width: 20)
                                ],
                              ),
                            ],
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
