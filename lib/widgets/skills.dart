import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title section
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'My ',
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
              ),
              TextSpan(
                text: 'Talent\n',
                style: TextStyle(color: Color(0xffFF014F), fontSize: 16),
              ),
              TextSpan(
                text: 'Professional Skills',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 500,
          width:700,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
             
            children: [
              _card('Flutter', 'assets/images/flutter.png'),
              _card('Python', 'assets/images/python.png'),
              _card('Dart', 'assets/images/dart.png'),
              _card('Firebase', 'assets/images/firebase.png'),
              _card('Git', 'assets/images/git.png'),
              _card('Figma', 'assets/images/figma.png'),
            ],
          ),
        )
      ],
    );
  }
}

Widget _card(String title, String imagepath) {
  return Container(
    height: 60,
    width: 60, 
    decoration: BoxDecoration(
      color: const Color(0xff1E1E1E),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagepath,
          height: 60, 
          width: 60, 
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
