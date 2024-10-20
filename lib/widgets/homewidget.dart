import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeWidget extends StatelessWidget {
  
  final GlobalKey contactKey; // Add this line to accept the key

  const HomeWidget({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'HELLO, MY NAME IS\n',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xffFFFFFF).withOpacity(0.651),
                      ),
                    ),
                    const TextSpan(
                      text: 'Abhishek ', // First name
                      style: TextStyle(
                        fontSize: 45, // Adjust size as per design
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFF014F), // Color for 'Abhishek'
                      ),
                    ),
                    const TextSpan(
                      text: 'Pawar', // Last name
                      style: TextStyle(
                        fontSize: 45, // Same size, or you can adjust it
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Color for 'Pawar'
                      ),
                    ),
                    TextSpan(
                      text: '\n\nFLUTTER DEVELOPER\n',
                      style: TextStyle(
                        fontSize: 28,
                        color: const Color(0xffFFFFFF).withOpacity(0.651),
                      ),
                    ),
                    TextSpan(
                      text:
                          '\nB-Tech student majoring in Computer Science with Artificial,'
                          '\nIntelligence with a focused interest in',
                      style: GoogleFonts.katibeh(
                          textStyle: const TextStyle(
                              fontSize: 25, color: Color(0xffFFFFFF))),
                    ),
                    TextSpan(
                      text: ' Flutter development',
                      style: GoogleFonts.katibeh(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          color: Color(0xffFF014F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      const url = 'https://drive.google.com/uc?export=download&id=1Tc8l-tjSUcLiRjK4-HovXOWPRl792WHI';
                      // ignore: deprecated_member_use
                      if (await canLaunch(url)) {
                        // ignore: deprecated_member_use
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';                          
                      }
                    },
                    child: Container(
                      height: 48,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFF014F),
                      ),
                      child: const Center(
                        child: Text(
                          'Download Resume',
                          style: TextStyle(color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  InkWell(
                    onTap: () {
                       Scrollable.ensureVisible(contactKey.currentContext!);
                    },
                    child: Container(
                      height: 48,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffFF014F)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Contact Me',
                          style: TextStyle(color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => launchUrlString('https://github.com/abhipawar2004'),
                    child: Image.asset(
                      'assets/images/a.png',
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => launchUrlString('https://www.linkedin.com/in/abhishek-pawar10'),
                    child: Image.asset(
                      'assets/images/2.png',
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                     onTap: () => launchUrlString('mailto:pawarabhi2004@gmail.com'),
                    child: Image.asset(
                      'assets/images/3.png',
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => launchUrlString('https://twitter.com/@pawarabhi2004'),
                    child: Image.asset(
                      'assets/images/4.png',
                      height: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 500,
            child: Image.asset(
              'assets/images/my.png',
            ),
          ),
        ],
      ),
    );
  }
}
