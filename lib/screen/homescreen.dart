import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/contact.dart';
import 'package:my_portfolio/widgets/expertise.dart';
import 'package:my_portfolio/widgets/homewidget.dart';
import 'package:my_portfolio/widgets/projects.dart';
import 'package:my_portfolio/widgets/skills.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ScrollController _scrollController = ScrollController();
  
  // Define keys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        actions: [
          const Spacer(flex: 5),
          InkWell(
            onTap: () => _scrollToSection(_homeKey),
            child: Text(
              'Home',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xffFF014F),
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          InkWell(
            onTap: () => _scrollToSection(_expertiseKey),
            child: Text(
              'Services',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          InkWell(
            onTap: () => _scrollToSection(_skillsKey),
            child: Text(
              'Skills',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          InkWell(
            onTap: () => _scrollToSection(_projectsKey),
            child: Text(
              'Projects',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          InkWell(
            onTap: () => _scrollToSection(_contactKey),
            child: Text(
              'Contact',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              HomeWidget(key: _homeKey,contactKey:_contactKey),
              SizedBox(height: 50),
              ExpertiseScreen(key: _expertiseKey),
              SizedBox(height: 100),
              Skills(key: _skillsKey),
              SizedBox(height: 50),
              Projects(key: _projectsKey),
              SizedBox(height: 50),
              Contact(key: _contactKey),
            ],
          ),
        ),
      ),
    );
  }
}
