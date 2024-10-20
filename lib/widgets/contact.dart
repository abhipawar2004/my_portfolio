import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get In Touch',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Let’s Talk For your",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 34),
                      ),
                      TextSpan(
                        text: '\nNext Projects',
                        style:
                            TextStyle(color: Color(0xffFF014F), fontSize: 34),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Discuss a project or just want to say hi?\nConnect with me via email or through a phone call.',
                  style: TextStyle(color: Color(0xffB1B1B1), fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: ContactFormField(hintText: "Full Name"),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ContactFormField(hintText: "Email Address"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: ContactFormField(hintText: "Phone Number"),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ContactFormField(hintText: "Subject"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const ContactFormField(
                  hintText: "Message",
                  maxLines: 5,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF014F),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Send Message',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Icon(Icons.send, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Form Field Widget
class ContactFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;

  const ContactFormField({
    required this.hintText,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: const Color(0xff1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}