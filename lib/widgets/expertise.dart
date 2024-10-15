import 'package:flutter/material.dart';

class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(children: [
      Text.rich(TextSpan(children: [
        TextSpan(text: 'I like to make things easy and fun',
        style: TextStyle()),
      ],),),
     ],
    );
  }
}
