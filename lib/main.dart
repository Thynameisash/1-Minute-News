import 'package:flutter/material.dart';
import 'package:newsapp/homescreen.dart';
import 'package:newsapp/newsscreen.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(
    MaterialApp(
        // theme: ThemeData(
        //     scaffoldBackgroundColor: Color.fromARGB(255, 123, 120, 120),),
        debugShowCheckedModeBanner: false,
        initialRoute: 'homescreen',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'homescreen': (context) => const MyHomeScreen(),
        }),
  );
}
