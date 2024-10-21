import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/contact.dart';
import 'package:my_portfolio/widgets/expertise.dart';
import 'package:my_portfolio/widgets/homewidget.dart';
import 'package:my_portfolio/widgets/projects.dart';
import 'package:my_portfolio/widgets/skills.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // Define keys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Keep track of the current selected section
  String _selectedSection = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Get the positions of each section
    final homePosition = _getPosition(_homeKey);
    final expertisePosition = _getPosition(_expertiseKey);
    final skillsPosition = _getPosition(_skillsKey);
    final projectsPosition = _getPosition(_projectsKey);
    final contactPosition = _getPosition(_contactKey);

    // Get the current scroll offset
    final currentScroll = _scrollController.offset;

    // Determine which section is in view based on the scroll position
    if (currentScroll >= contactPosition - 100) {
      _updateSelectedSection('Contact');
    } else if (currentScroll >= projectsPosition - 100) {
      _updateSelectedSection('Projects');
    } else if (currentScroll >= skillsPosition - 100) {
      _updateSelectedSection('Skills');
    } else if (currentScroll >= expertisePosition - 100) {
      _updateSelectedSection('Services');
    } else if (currentScroll >= homePosition - 100) {
      _updateSelectedSection('Home');
    }
  }

  // Helper function to get the position of each section
  double _getPosition(GlobalKey key) {
    final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero).dy + _scrollController.offset;
  }

  void _updateSelectedSection(String section) {
    if (_selectedSection != section) {
      setState(() {
        _selectedSection = section;
      });
    }
  }

  void _scrollToSection(GlobalKey key, String section) {
    // Immediately update the selected section when scrolling
    _updateSelectedSection(section);
    
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        actions: [
          const Spacer(flex: 5),
          _buildAppBarItem('Home', _homeKey),
          const Spacer(flex: 1),
          _buildAppBarItem('Services', _expertiseKey),
          const Spacer(flex: 1),
          _buildAppBarItem('Skills', _skillsKey),
          const Spacer(flex: 1),
          _buildAppBarItem('Projects', _projectsKey),
          const Spacer(flex: 1),
          _buildAppBarItem('Contact', _contactKey),
          const Spacer(flex: 1),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              _buildSection(HomeWidget(key: _homeKey, contactKey: _contactKey)),
              const SizedBox(height: 30),
              _buildSection(ExpertiseScreen(key: _expertiseKey)),
              const SizedBox(height: 100),
              _buildSection(Skills(key: _skillsKey)),
              const SizedBox(height: 50),
              _buildSection(Projects(key: _projectsKey)),
              const SizedBox(height: 50),
              _buildSection(Contact(key: _contactKey)),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build AppBar items with scaling animation and no splash effect
  Widget _buildAppBarItem(String title, GlobalKey sectionKey) {
    // Use a ValueNotifier to track the scale factor
    final ValueNotifier<double> scaleFactor = ValueNotifier(1.0);

    // Update scale factor when the section is selected
    if (_selectedSection == title) {
      scaleFactor.value = 1.2; // Scale up when selected
    } else {
      scaleFactor.value = 1.0; // Normal size
    }

    return ValueListenableBuilder<double>(
      valueListenable: scaleFactor,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Material(
            color: Colors.transparent, // Set background color to transparent
            child: InkWell(
              onTap: () {
                _scrollToSection(sectionKey, title);
                // Trigger a rebuild for the selected section
                scaleFactor.value = 1.2; // Scale up
                Future.delayed(Duration(milliseconds: 200), () {
                  scaleFactor.value = 1.0; // Scale back down after a delay
                });
              },
              splashColor: Colors.transparent, // Disable splash color
              highlightColor: Colors.transparent, // Disable highlight color
              child: Text(
                title,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: _selectedSection == title ? const Color(0xffFF014F) : const Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to wrap each section without animation
  Widget _buildSection(Widget section) {
    return section; // Simply return the section without opacity
  }
}
