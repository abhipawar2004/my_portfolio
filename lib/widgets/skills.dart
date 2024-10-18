import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title section
        Text.rich(
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
        SizedBox(height: 20),
        
        
        Container(
          height: 500, 
          padding: EdgeInsets.symmetric(horizontal: 20), 
          child: GridView.builder(
          
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              crossAxisSpacing: 20, 
              mainAxisSpacing: 20,
              childAspectRatio: .8, 
            ),
            itemBuilder: (context, index) {
              
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xff1E1E1E),
                  borderRadius: BorderRadius.circular(15), 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Image.asset(
                      _getSkillIcon(index), 
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    
                    Text(
                      _getSkillName(index), 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  
  String _getSkillName(int index) {
    List<String> skills = ['Flutter', 'Python', 'Dart', 'Firebase', 'Git', 'Figma'];
    return skills[index];
  }


  String _getSkillIcon(int index) {
    List<String> icons = [
      'assets/images/flutter.png',
      'assets/images/python.png',
      'assets/images/dart.png',
      'assets/images/firebase.png',
      'assets/images/git.png',
      'assets/images/figma.png',
    ];
    return icons[index];
  }
}
