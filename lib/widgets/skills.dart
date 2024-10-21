import 'package:flutter/material.dart';
import 'dart:math';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int selectedCardIndex = -1;

  @override
  void initState() {
    super.initState();

    // AnimationController setup
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Tween to rotate twice (4π radians = 2 full rotations)
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
      child: Column(
        children: [
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
            width: 600,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCardIndex = index;
                      _controller.reset();
                      _controller.forward(); // Start the animation
                    });
                  },
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return _card(
                        ['Flutter', 'Python', 'Dart', 'Firebase', 'Git', 'Figma'][index],
                        ['assets/images/flutter.png', 'assets/images/python.png', 'assets/images/dart.png', 'assets/images/firebase.png', 'assets/images/git.png', 'assets/images/figma.png'][index],
                        index == selectedCardIndex ? _animation.value : 0, // Apply rotation only to selected card
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(String title, String imagepath, double rotation) {
    return Transform(
      transform: Matrix4.rotationZ(rotation), // Apply the rotation transformation
      alignment: Alignment.center, // Rotate around the center
      child: Container(
        height: 40,
        width: 40,
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
      ),
    );
  }
}
