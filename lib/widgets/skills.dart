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

    // Create a TweenSequence for a forward and backward flip
    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: pi), weight: 50), // Forward flip
      TweenSequenceItem(tween: Tween<double>(begin: pi, end: 0), weight: 50),  // Backward flip
    ]).animate(_controller);
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
                      _controller.forward(); // Start the flip animation
                    });
                  },
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return _card(
                        ['Flutter', 'Python', 'Dart', 'Firebase', 'Git', 'Figma'][index],
                        ['assets/images/flutter.png', 'assets/images/python.png', 'assets/images/dart.png', 'assets/images/firebase.png', 'assets/images/git.png', 'assets/images/figma.png'][index],
                        index == selectedCardIndex ? _animation.value : 0, // Apply flip to selected card
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
    // Flip effect using rotationY for 3D flip animation
    return Transform(
      transform: Matrix4.rotationY(rotation),
      alignment: Alignment.center,
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
