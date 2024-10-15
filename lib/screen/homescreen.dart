import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/expertise.dart';
import 'package:my_portfolio/widgets/homewidget.dart';
import 'package:my_portfolio/widgets/skills.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131313),
      appBar: AppBar(
        backgroundColor: Color(0xff131313),
        actions: [
          Spacer(
            flex: 5,
          ),
          Text(
            'Home',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                color: Color(0xffFF014F),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            'Services',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            'Skills',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            'Projects',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            'Contact',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(45),
          child: Column(
            children: [
               HomeWidget(),
               SizedBox(height: 100),
               ExpertiseScreen(),
               SizedBox(height: 100),
               Skills(),
             
            ],
          ),
        ),
      ),
    );
  }
}
