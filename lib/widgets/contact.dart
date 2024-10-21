import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Contact({super.key});

  Future<void> sendEmail({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_fpubi5b'; // Your EmailJS service ID
    const templateId = 'template_018vdc6'; // Your EmailJS template ID
    const publicKey = 'FBfaM2EluNQ9jCvd7'; // Your EmailJS public key

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'from_phone': phone,
          'subject': subject,
          'message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      // Successfully sent the email
      print('Email sent successfully!');
    } else {
      print('Failed to send email: ${response.body}');
    }
  }

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
                        style: TextStyle(
                            color: Color(0xffFFFFFF), fontSize: 34),
                      ),
                      TextSpan(
                        text: '\nNext Projects',
                        style: TextStyle(
                            color: Color(0xffFF014F), fontSize: 34),
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(hintText: "Full Name"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(hintText: "Email Address"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        decoration: const InputDecoration(hintText: "Phone Number"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: subjectController,
                        decoration: const InputDecoration(hintText: "Subject"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: messageController,
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: "Message"),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      sendEmail(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        subject: subjectController.text,
                        message: messageController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF014F),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
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
