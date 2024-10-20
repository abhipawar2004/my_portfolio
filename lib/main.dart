import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screen/homescreen.dart';

void main() {
  runApp(const MyPortfolio());
}
class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),),
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}

