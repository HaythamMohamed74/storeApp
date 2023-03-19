import 'package:flutter/material.dart';
import 'package:store_app/screens/homePage.dart';
import 'package:store_app/screens/splashScreen.dart';
import 'package:store_app/screens/updatePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:  Home(),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        Home.id:(context) =>  Home()  ,
        UpdatePage.id:(context)=>UpdatePage()
      },
    );
  }
}


