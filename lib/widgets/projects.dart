import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Explore My Popular ',
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 34),
              ),
              TextSpan(
                text: 'Projects',
                style: TextStyle(color: Color(0xffFF014F), fontSize: 34),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
                Container(
                  height: 500,
                  width: 500,
                  color: Color(0xff1E1E1E),
                ),
          ],
        ),
      ],
    );
  }
}
