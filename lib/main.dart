import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/homescreen.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      // theme: ThemeData(
      //     scaffoldBackgroundColor: Color.fromARGB(255, 123, 120, 120),),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'homescreen': (context) => const MyHomeScreen(),
      },
    ),
  );
}
