import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                      fontSize: 34),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            itemCount: 6,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Container(height: 50, width: 50,color: Color(0xff1E1E1E),);
            },
          ),
        ],
      ),
    );
  }
}
