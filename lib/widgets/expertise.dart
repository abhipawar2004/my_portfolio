import 'package:flutter/material.dart';

class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
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
              height:300,
              width: 300,
              decoration: BoxDecoration(
                  color: Color(0xff1E1E1E),
                  borderRadius: BorderRadius.all(Radius.circular(10),),),
                  child: Column(
                    
                    children: [
                        Image.asset('assets/images/Phone.png',
                        height: 28,)
                    ],
                  ),
            ),
             Container(
              height:280,
              width: 280,
              decoration: BoxDecoration(
                  color: Color(0xff1E1E1E),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            
          ],
        ),
      ],
    );
  }
}
