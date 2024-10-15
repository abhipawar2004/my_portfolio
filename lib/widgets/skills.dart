import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'My ',
                style: TextStyle(color:Color(0xffFFFFFF),fontSize: 16),
              ),
              TextSpan(
                text: 'Talent\n',
                style: TextStyle(color:Color(0xffFF014F),fontSize: 16),
              ),
              TextSpan(text: 'Professional Skills',style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 34
              ),),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20,),
        GridView.count(crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
            _buildSkillCard('Flutter', 'assets/images/flutter.png'),
            _buildSkillCard('Python', 'assets/images/python.png'),
            _buildSkillCard('Dart', 'assets/images/dart.png'),
            _buildSkillCard('Firebase', 'assets/images/firebase.png'),
            _buildSkillCard('Git', 'assets/images/git.png'),
            _buildSkillCard('Figma', 'assets/images/figma .png'),
        ],
        )
      ],
    );
  }
}

Widget _buildSkillCard(String title, String assetPath) {
    return Card(
      color: Color(0xFF252525), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
