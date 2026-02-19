import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isMessageSent = false;
  double opacity = 0.0;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendEmail({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
  }) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    const serviceId = 'service_fpubi5b';
    const templateId = 'template_018vdc6';
    const publicKey = 'FBfaM2EluNQ9jCvd7';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
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
        setState(() {
          isLoading = false;
          isMessageSent = true;

          // Clear all input fields
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          subjectController.clear();
          messageController.clear();
        });

        // Show success message with animation
        setState(() {
          opacity = 1.0;
        });

        await Future.delayed(const Duration(seconds: 3));
        setState(() {
          opacity = 0.0;
          isMessageSent = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        _showErrorSnackBar('Failed to send message. Please try again.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorSnackBar('An error occurred. Please check your connection.');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: const Color(0xffFF014F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 50,
        vertical: isMobile ? 50 : 100,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 900;
          return isWideScreen ? _buildDesktopLayout() : _buildMobileLayout();
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff1E1E1E),
              const Color(0xff1A1A1A),
            ],
          ),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffFF014F).withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildHeaderSection(),
            ),
            const SizedBox(width: 80),
            Expanded(
              flex: 3,
              child: _buildContactForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff1E1E1E),
            const Color(0xff1A1A1A),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 40),
          _buildContactForm(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xffFF014F).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xffFF014F).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.mail_outline_rounded,
                color: Color(0xffFF014F),
                size: 16,
              ),
              SizedBox(width: 6),
              Text(
                'Get In Touch',
                style: TextStyle(
                  color: Color(0xffFF014F),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Title
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Let's Talk For your\n",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                  letterSpacing: -0.5,
                ),
              ),
              TextSpan(
                text: 'Next Project',
                style: TextStyle(
                  color: Color(0xffFF014F),
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Discuss a project or just want to say hi?\nConnect with me via email or through a phone call.',
          style: TextStyle(
            color: Color(0xffB1B1B1),
            fontSize: 15,
            height: 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Desktop layout - side by side
          LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 500;
              if (isWide) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            nameController,
                            "Full Name",
                            Icons.person_outline,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildTextField(
                            emailController,
                            "Email Address",
                            Icons.email_outlined,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Email is required';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value!)) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            phoneController,
                            "Phone Number",
                            Icons.phone_outlined,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Phone is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildTextField(
                            subjectController,
                            "Subject",
                            Icons.subject_outlined,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Subject is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildTextField(
                        nameController, "Full Name", Icons.person_outline),
                    const SizedBox(height: 20),
                    _buildTextField(
                        emailController, "Email Address", Icons.email_outlined),
                    const SizedBox(height: 20),
                    _buildTextField(
                        phoneController, "Phone Number", Icons.phone_outlined),
                    const SizedBox(height: 20),
                    _buildTextField(
                        subjectController, "Subject", Icons.subject_outlined),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: messageController,
            maxLines: 6,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Message is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Your Message",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 15,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16, right: 12, top: 12),
                child: Icon(
                  Icons.message_outlined,
                  color: const Color(0xffFF014F),
                  size: 22,
                ),
              ),
              filled: true,
              fillColor: const Color(0xff252525),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.05),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xffFF014F),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Send Button
          SizedBox(
            height: 58,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
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
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                shadowColor: const Color(0xffFF014F).withOpacity(0.5),
                disabledBackgroundColor:
                    const Color(0xffFF014F).withOpacity(0.6),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Send Message',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.send_rounded, size: 20),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 24),
          // Success Message
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 500),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.check_circle_outline, color: Colors.green),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Message sent successfully! I\'ll get back to you soon.',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon, {
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      validator: validator ??
          (value) {
            if (value?.isEmpty ?? true) {
              return 'This field is required';
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.4),
          fontSize: 15,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xffFF014F),
          size: 22,
        ),
        filled: true,
        fillColor: const Color(0xff252525),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xffFF014F),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
