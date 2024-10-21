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

  void _scrollToSection(GlobalKey key) {
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
              _buildAnimatedSection(HomeWidget(key: _homeKey, contactKey: _contactKey)),
              const SizedBox(height: 30),
              _buildAnimatedSection(ExpertiseScreen(key: _expertiseKey)),
              const SizedBox(height: 100),
              _buildAnimatedSection(Skills(key: _skillsKey)),
              const SizedBox(height: 50),
              _buildAnimatedSection(Projects(key: _projectsKey)),
              const SizedBox(height: 50),
              _buildAnimatedSection(Contact(key: _contactKey)),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build AppBar items with animated color changes
  Widget _buildAppBarItem(String title, GlobalKey sectionKey) {
    return InkWell(
      onTap: () => _scrollToSection(sectionKey),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 20,
            color: _selectedSection == title ? const Color(0xffFF014F) : const Color(0xffFFFFFF),
          ),
        ),
        child: Text(title),
      ),
    );
  }

  // Method to wrap each section in an AnimatedOpacity widget for fade-in effect
  Widget _buildAnimatedSection(Widget section) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _selectedSection == _getSectionTitle(section) ? 1.0 : 0.5,
      child: section,
    );
  }

  // Helper method to get the section's title (for opacity effect)
  String _getSectionTitle(Widget section) {
    if (section.key == _homeKey) return 'Home';
    if (section.key == _expertiseKey) return 'Services';
    if (section.key == _skillsKey) return 'Skills';
    if (section.key == _projectsKey) return 'Projects';
    if (section.key == _contactKey) return 'Contact';
    return '';
  }
}
