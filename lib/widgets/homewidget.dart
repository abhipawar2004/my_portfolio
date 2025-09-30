import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeWidget extends StatelessWidget {
  final GlobalKey contactKey;

  const HomeWidget({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 768;
    double padding = isMobile ? 16 : 50;
    double fontSizeMain = isMobile ? 28 : 45;
    double fontSizeSecondary = isMobile ? 18 : 28;
    double buttonWidth = isMobile ? screenWidth * 0.4 : 180;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(padding),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isMobile) ...[
              // Mobile layout - vertical stack
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image first on mobile
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/my.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Text content
                  _buildTextContent(fontSizeMain, fontSizeSecondary),
                  const SizedBox(height: 30),
                  _buildMobileButtons(buttonWidth),
                  const SizedBox(height: 25),
                  _buildSocialMediaRow(),
                ],
              ),
            ] else ...[
              // Desktop layout - horizontal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextContent(fontSizeMain, fontSizeSecondary),
                        const SizedBox(height: 50),
                        _buildDesktopButtons(buttonWidth),
                        const SizedBox(height: 25),
                        _buildSocialMediaRow(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 400,
                      child: Image.asset(
                        'assets/images/my.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent(double fontSizeMain, double fontSizeSecondary) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'HELLO, MY NAME IS\n',
            style: TextStyle(
              fontSize: 20,
              color: const Color(0xffFFFFFF).withOpacity(0.651),
            ),
          ),
          TextSpan(
            text: 'Abhishek ',
            style: TextStyle(
              fontSize: fontSizeMain,
              fontWeight: FontWeight.bold,
              color: const Color(0xffFF014F),
            ),
          ),
          TextSpan(
            text: 'Pawar',
            style: TextStyle(
              fontSize: fontSizeMain,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: '\n\nFLUTTER DEVELOPER\n',
            style: TextStyle(
              fontSize: fontSizeSecondary,
              color: const Color(0xffFFFFFF).withOpacity(0.651),
            ),
          ),
          TextSpan(
            text:
                '\nB-Tech student majoring in Computer Science\nwith Artificial Intelligence with a focused interest in',
            style: GoogleFonts.katibeh(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          TextSpan(
            text: ' Flutter development',
            style: GoogleFonts.katibeh(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Color(0xffFF014F),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileButtons(double buttonWidth) {
    return Column(
      children: [
        _buildButton(
          text: 'Download Resume',
          color: const Color(0xffFF014F),
          textColor: Colors.white,
          width: buttonWidth * 2,
          onPressed: () async {
            const url =
                'https://www.dropbox.com/scl/fi/irx21lvy8rmjyaa1qzirt/AbhishekPawar_Resume.pdf?rlkey=vx332ghnxk56i8igbtqt8nkt1&st=85x1hns4&dl=1';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        const SizedBox(height: 15),
        _buildButton(
          text: 'Contact Me',
          color: Colors.transparent,
          borderColor: const Color(0xffFF014F),
          textColor: Colors.white,
          width: buttonWidth * 2,
          onPressed: () {
            Scrollable.ensureVisible(contactKey.currentContext!);
          },
        ),
      ],
    );
  }

  Widget _buildDesktopButtons(double buttonWidth) {
    return Row(
      children: [
        _buildButton(
          text: 'Download Resume',
          color: const Color(0xffFF014F),
          textColor: Colors.white,
          width: 180,
          onPressed: () async {
            const url =
                'https://www.dropbox.com/scl/fi/irx21lvy8rmjyaa1qzirt/AbhishekPawar_Resume.pdf?rlkey=vx332ghnxk56i8igbtqt8nkt1&st=85x1hns4&dl=1';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        const SizedBox(width: 15),
        _buildButton(
          text: 'Contact Me',
          color: Colors.transparent,
          borderColor: const Color(0xffFF014F),
          textColor: Colors.white,
          width: 160,
          onPressed: () {
            Scrollable.ensureVisible(contactKey.currentContext!);
          },
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    Color borderColor = Colors.transparent,
    required Color textColor,
    required double width,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaRow() {
    return Row(
      children: [
        _buildSocialMediaIcon(
            'https://github.com/abhipawar2004', 'assets/images/a.png'),
        const SizedBox(width: 10),
        _buildSocialMediaIcon('https://www.linkedin.com/in/abhishek-pawar10',
            'assets/images/2.png'),
        const SizedBox(width: 10),
        _buildSocialMediaIcon(
            'mailto:pawarabhi2004@gmail.com', 'assets/images/3.png'),
        const SizedBox(width: 10),
        _buildSocialMediaIcon(
            'https://twitter.com/@pawarabhi2004', 'assets/images/4.png'),
      ],
    );
  }

  Widget _buildSocialMediaIcon(String url, String assetPath) {
    return InkWell(
      onTap: () => launchUrlString(url),
      child: Image.asset(
        assetPath,
        height: 35,
      ),
    );
  }
}
