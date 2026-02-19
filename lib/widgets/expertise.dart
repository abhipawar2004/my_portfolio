import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double margin = 50;
    double cardWidth = 300;
    double cardHeight = 300;

    return Container(
      margin: EdgeInsets.only(left: margin, right: margin, top: 20),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'I like to make things easy and fun\n\n',
                  style: TextStyle(
                      color: const Color(0xffFFFFFF), fontSize: 16),
                ),
                TextSpan(
                  text: 'My ',
                  style: TextStyle(
                      color: const Color(0xffFFFFFF), fontSize: 34),
                ),
                TextSpan(
                  text: 'Special Services ',
                  style: TextStyle(
                      color: const Color(0xffFF014F), fontSize: 34),
                ),
                TextSpan(
                  text: 'for your\n' 'Business ',
                  style: TextStyle(
                      color: const Color(0xffFFFFFF), fontSize: 34),
                ),
                TextSpan(
                  text: 'Development\n\n',
                  style: TextStyle(
                      color: const Color(0xffFF014F), fontSize: 34),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          // Desktop layout - horizontal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildServiceCard(
                'assets/images/Phone.png',
                'APP DEVELOPMENT',
                'Modern and mobile-ready application that will help you reach all of your marketing.',
                cardWidth,
                cardHeight,
              ),
              _buildServiceCard(
                'assets/images/Design.png',
                'UI/UX DESIGN',
                'Create intuitive interfaces and delightful user experiences by blending aesthetics with usability.',
                cardWidth,
                cardHeight,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String imagePath, String title, String description,
      double width, double height) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xff1E1E1E),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            height: 50,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
