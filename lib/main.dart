import 'package:app_api/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Sushi app',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Color(0xFFf2f5ff),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: OnBoardingPage(),
    );
  }
}
