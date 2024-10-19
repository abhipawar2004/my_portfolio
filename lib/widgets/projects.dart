import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Text.rich(
            textAlign: TextAlign.center,
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
          SizedBox(height: 50),
          Row(
            children: [
              Container(
                height: 280,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1E1E1E)),
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Text.rich(
                    
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mobile Application\n\n',
                          style:
                              TextStyle(color: Color(0xffFF014F), fontSize: 13),
                        ),
                        TextSpan(
                          text: 'BillWiz\n\n',
                          style:
                              TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
                        ),
                        TextSpan( 
                          text:
                              'This app lets users browse a restaurant menu, add items to their cart, and choose full or half portions. Users can adjust quantities, edit, or remove items with ease, providing a smooth and intuitive ordering experience',
                          style:
                              TextStyle(color: Color(0xffFFFFFF), fontSize: 13) ,
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
