import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/contact.dart';
import 'package:my_portfolio/widgets/expertise.dart';
import 'package:my_portfolio/widgets/homewidget.dart';
import 'package:my_portfolio/widgets/projects.dart';
import 'package:my_portfolio/widgets/skills.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        actions: [
          const Spacer(
            flex: 5,
          ),
          Text(
            'Home',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xffFF014F),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            'Services',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            'Skills',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            'Projects',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            'Contact',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 40,right: 40),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                 HomeWidget(),
                 SizedBox(height: 50),
                 ExpertiseScreen(),
                 SizedBox(height: 100),
                 Skills(),
                 SizedBox(height: 50),
                 Projects(),
                SizedBox(height: 50),
                Contact(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
