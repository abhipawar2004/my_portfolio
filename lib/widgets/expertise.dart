import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50,right: 50,top: 20),
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'I like to make things easy and fun\n\n',
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
                TextSpan(
                  text: 'My ',
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 34),
                ),
                TextSpan(
                  text: 'Special Services ',
                  style: TextStyle(color: Color(0xffFF014F), fontSize: 34),
                ),
                TextSpan(
                  text: 'for your\n' 'Business ',
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 34),
                ),
                TextSpan(
                  text: 'Development\n\n',
                  style: TextStyle(color: Color(0xffFF014F), fontSize: 34),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 300,
                width: 300,
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
                      'assets/images/Phone.png',
                      height:50,
                    ),
      
                    Text('APP DEVELOPMENT',style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),),
                    const Text('Modern and mobile-ready application that will help you reach all of your marketing.',
                    style:TextStyle(color: Colors.white),textAlign: TextAlign.center),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 300,
                width: 300,
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
                      'assets/images/Design.png',
                      height:50,
                    ),
      
                    Text('UI/UX DESIGN',style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),),
                    const Text('Create intuitive interfaces and delightful user experiences by blending aesthetics with usability.',
                    style:TextStyle(color: Colors.white),textAlign: TextAlign.center),
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
