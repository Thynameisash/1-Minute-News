import 'package:flutter/material.dart';
import 'package:newsapp/catslider.dart';
import 'package:newsapp/constants/colors.dart';
import 'package:newsapp/newsscreen.dart';
import 'package:newsapp/sourceslider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryc,
      appBar: AppBar(
        backgroundColor: ConstColors.navc,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 120),
            child: Text(
              'Discover',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NewsScreen(category: "general", source: "null")),
              );
            },
            child: Row(
              children: const [
                Text(
                  "General",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          CategorySlider(),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              "Sources",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: SourceSlider(),
          ),
        ],
      ),
    );
  }
}
