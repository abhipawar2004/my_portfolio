import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isLoading = false; // To manage loading state

  Future<void> sendEmail({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
    required BuildContext context,
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

    setState(() {
      isLoading = false; // Stop loading
    });

    if (response.statusCode == 200) {
      // Clear all input fields
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      subjectController.clear();
      messageController.clear();

      // Show success Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Message sent successfully!')),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Show error Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('Failed to send message: ${response.body}')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void handleSendMessage(BuildContext context) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final subject = subjectController.text.trim();
    final message = messageController.text.trim();

    // Input validation
    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        subject.isEmpty ||
        message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Fields cannot be Empty.')),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true; // Start loading
    });

    sendEmail(
      name: name,
      email: email,
      phone: phone,
      subject: subject,
      message: message,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: const Color(0xff1E1E1E),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: const Color(0xff1E1E1E),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
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
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: const Color(0xff1E1E1E),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: subjectController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Subject",
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: const Color(0xff1E1E1E),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: messageController,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xff1E1E1E),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () => handleSendMessage(context),
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
        ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
