import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
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
                      text: 'HELLO, MY NAME IS',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xffFFFFFF).withOpacity(0.651),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Abhishek ', // First name
                      style: TextStyle(
                        fontSize: 45, // Adjust size as per design
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFF014F), // Color for 'Abhishek'
                      ),
                    ),
                    TextSpan(
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
              SizedBox(height: 70), 
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, 
                children: [
                  InkWell(
                    onTap: () {},
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
                  SizedBox(width: 18),
                  InkWell(
                    onTap: () {},
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
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/a.png',
                    height: 35,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/2.png',
                    height: 35,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/3.png',
                    height: 35,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/4.png',
                    height: 35,
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
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
