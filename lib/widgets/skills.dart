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
        
        // Grid section
        Container(
          height: 500, // Adjust the height to fit your design
          padding: EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding to align grid
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(), // Prevent scrolling within the grid
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              crossAxisSpacing: 20, // Spacing between grid items
              mainAxisSpacing: 20,
              childAspectRatio: 1, // Makes the grid items square
            ),
            itemBuilder: (context, index) {
              // Skill card container
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xff1E1E1E), // Background color
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your image assets here
                    Image.asset(
                      _getSkillIcon(index), // Get the correct icon
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    // Skill title
                    Text(
                      _getSkillName(index), // Get the correct skill name
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

  // Function to get the skill name
  String _getSkillName(int index) {
    List<String> skills = ['Flutter', 'Python', 'Dart', 'Firebase', 'Git', 'Figma'];
    return skills[index];
  }

  // Function to get the skill icon
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
