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

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

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
    final homePosition = _getPosition(_homeKey);
    final expertisePosition = _getPosition(_expertiseKey);
    final skillsPosition = _getPosition(_skillsKey);
    final projectsPosition = _getPosition(_projectsKey);
    final contactPosition = _getPosition(_contactKey);

    final currentScroll = _scrollController.offset;

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

  double _getPosition(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
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
    _updateSelectedSection(section);
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: const Color(0xff131313),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Abhishek Pawar',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: isMobile
            ? null
            : [
                const Spacer(flex: 3),
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
      drawer: isMobile ? _buildMobileDrawer() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double marginHorizontal = constraints.maxWidth > 768 ? 40 : 16;
          double sectionSpacing = constraints.maxWidth > 768 ? 100 : 50;

          return SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
              child: Column(
                children: [
                  _buildSection(
                      HomeWidget(key: _homeKey, contactKey: _contactKey)),
                  SizedBox(height: sectionSpacing / 2),
                  _buildSection(ExpertiseScreen(key: _expertiseKey)),
                  SizedBox(height: sectionSpacing),
                  _buildSection(Skills(key: _skillsKey)),
                  SizedBox(height: sectionSpacing / 2),
                  _buildSection(Projects(key: _projectsKey)),
                  SizedBox(height: sectionSpacing / 2),
                  _buildSection(Contact(key: _contactKey)),
                  const SizedBox(height: 50), // Bottom padding
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppBarItem(String title, GlobalKey sectionKey) {
    final ValueNotifier<double> scaleFactor = ValueNotifier(1.0);

    if (_selectedSection == title) {
      scaleFactor.value = 1.2;
    } else {
      scaleFactor.value = 1.0;
    }

    return ValueListenableBuilder<double>(
      valueListenable: scaleFactor,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _scrollToSection(sectionKey, title);
                scaleFactor.value = 1.2;
                Future.delayed(const Duration(milliseconds: 100), () {
                  scaleFactor.value = 1.0;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                title,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: _selectedSection == title
                        ? const Color(0xffFF014F)
                        : const Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(Widget section) {
    return section;
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: const Color(0xff1E1E1E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff131313),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abhishek Pawar',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flutter Developer',
                  style: GoogleFonts.inter(
                    color: const Color(0xffFF014F),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem('Home', _homeKey, Icons.home),
          _buildDrawerItem('Services', _expertiseKey, Icons.work),
          _buildDrawerItem('Skills', _skillsKey, Icons.star),
          _buildDrawerItem('Projects', _projectsKey, Icons.folder),
          _buildDrawerItem('Contact', _contactKey, Icons.contact_mail),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, GlobalKey sectionKey, IconData icon) {
    bool isSelected = _selectedSection == title;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xffFF014F) : Colors.white,
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: isSelected ? const Color(0xffFF014F) : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        _scrollToSection(sectionKey, title);
      },
    );
  }
}
