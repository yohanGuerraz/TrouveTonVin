import 'package:flutter/material.dart';
import 'package:trouvetonvin/constants.dart';
import 'package:trouvetonvin/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrouveTonVin',
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.white,
        fontFamily: "Muli",
        appBarTheme : AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness:Brightness.light,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
