import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool showAll = false;

  final List<Map<String, dynamic>> allProjects = [
    {
      'title': 'MyRidez',
      'description':
          'A comprehensive ride-sharing application with real-time tracking, secure payments, and seamless booking experience for users.',
      'imagePaths': ['assets/images/MyRidez.png'],
    },
    {
      'title': 'ReflexoCure',
      'description':
          'Healthcare management system offering appointment scheduling, patient records management, and telemedicine consultations.',
      'imagePaths': ['assets/images/ReflexoCure.png'],
    },
    {
      'title': 'Mkart',
      'description':
          'E-commerce platform with intuitive UI, product catalog, cart management, and integrated payment gateway for smooth transactions.',
      'imagePaths': [
        'assets/images/2.png',
        'assets/images/3.png',
        'assets/images/4.png',
        'assets/images/a.png',
      ],
    },
    {
      'title': 'SIP Capital',
      'description':
          'Investment and portfolio management app with real-time market data, analytics, and personalized investment recommendations.',
      'imagePaths': ['assets/images/SIPCapital.png'],
    },
    {
      'title': 'BillWiz',
      'description':
          'This app lets users browse a restaurant menu, add items to their cart, and choose full or half portions. Users can adjust quantities, edit, or remove items with ease, providing a smooth and intuitive ordering experience.',
      'imagePaths': ['assets/images/BillWiz.png'],
    },
    {
      'title': 'Shopping App',
      'description':
          'Integrated features include user authentication, cart management, order tracking, and secure payment options, reducing login time by 20%.',
      'imagePaths': ['assets/images/Shop.png'],
    },
    {
      'title': 'MealMate',
      'description':
          'Features include a favorite section, filtering options for dietary preferences like gluten-free, lactose-free, vegan, and vegetarian recipes, as well as displaying meal duration, complexity, expenses, ingredients, and steps.',
      'imagePaths': ['assets/images/Meal.png'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    double margin = isMobile ? 0 : 50;
    double spacing = isMobile ? 50 : 80;

    List<Map<String, dynamic>> displayedProjects =
        showAll ? allProjects : allProjects.take(3).toList();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: isMobile
          ? const EdgeInsets.symmetric(horizontal: 16)
          : EdgeInsets.zero,
      child: Column(
        children: [
          // Modern header with animation
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 800),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Column(
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Explore My ',
                        style: TextStyle(
                          color: const Color(0xffFFFFFF),
                          fontSize: isMobile ? 28 : 42,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Featured\n',
                        style: TextStyle(
                          color: const Color(0xffFF014F),
                          fontSize: isMobile ? 28 : 42,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Projects',
                        style: TextStyle(
                          color: const Color(0xffFFFFFF),
                          fontSize: isMobile ? 28 : 42,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Crafted with passion, built with precision',
                  style: TextStyle(
                    color: const Color(0xffB1B1B1),
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          // Display projects
          ...List.generate(displayedProjects.length, (index) {
            return Column(
              children: [
                ProjectCard(
                  title: displayedProjects[index]['title'],
                  description: displayedProjects[index]['description'],
                  imagePaths: List<String>.from(
                      displayedProjects[index]['imagePaths'] as List),
                  reverseLayout: !isMobile && index % 2 == 1,
                  index: index,
                ),
                if (index < displayedProjects.length - 1)
                  SizedBox(height: spacing),
              ],
            );
          }),
          const SizedBox(height: 60),
          // See More / See Less Button
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 600),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  showAll = !showAll;
                });
              },
              icon: Icon(
                showAll ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                size: 24,
              ),
              label: Text(
                showAll ? 'Show Less' : 'See More Projects',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: const Color(0xffFF014F).withOpacity(0.5),
                    width: 2,
                  ),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> imagePaths;
  final bool reverseLayout;
  final int index;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePaths,
    this.reverseLayout = false,
    required this.index,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late PageController _pageController;
  int _currentImageIndex = 0;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _elevationAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hover) {
    setState(() => isHovered = hover);
    if (hover) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _onImageChanged(int index) {
    if (!mounted) return;
    setState(() {
      _currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600 + (widget.index * 200)),
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
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffFF014F).withOpacity(0.2),
                    blurRadius: _elevationAnimation.value,
                    spreadRadius: _elevationAnimation.value / 4,
                    offset: Offset(0, _elevationAnimation.value / 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff1E1E1E),
                        Color(0xff1A1A1A),
                      ],
                    ),
                    border: Border.all(
                      color: isHovered
                          ? const Color(0xffFF014F).withOpacity(0.5)
                          : Colors.white.withOpacity(0.1),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(40),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isWideScreen = constraints.maxWidth > 900;

                      if (isWideScreen) {
                        return _buildDesktopLayout();
                      } else {
                        return _buildMobileLayout();
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    final imageWidget = _buildScreenshotCarousel(width: 480, height: 340);

    final textWidget = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
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
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phone_android_rounded,
                    color: Color(0xffFF014F),
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Mobile Application',
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
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 38,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              widget.description,
              style: const TextStyle(
                color: Color(0xffB1B1B1),
                fontSize: 15,
                height: 1.7,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 32),
            // Action Buttons
            Row(
              children: [
                _buildActionButton(
                  icon: Icons.open_in_new_rounded,
                  label: 'View Project',
                  isPrimary: true,
                ),
                const SizedBox(width: 16),
                _buildActionButton(
                  icon: Icons.code_rounded,
                  label: 'Source Code',
                  isPrimary: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.reverseLayout
          ? [textWidget, const SizedBox(width: 40), imageWidget]
          : [imageWidget, const SizedBox(width: 40), textWidget],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Screenshot carousel
        _buildScreenshotCarousel(width: double.infinity, height: 240),
        const SizedBox(height: 24),
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
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_android_rounded,
                color: Color(0xffFF014F),
                size: 16,
              ),
              SizedBox(width: 6),
              Text(
                'Mobile Application',
                style: TextStyle(
                  color: Color(0xffFF014F),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Title
        Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // Description
        Text(
          widget.description,
          style: const TextStyle(
            color: Color(0xffB1B1B1),
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        // Action Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildActionButton(
              icon: Icons.open_in_new_rounded,
              label: 'View Project',
              isPrimary: true,
            ),
            _buildActionButton(
              icon: Icons.code_rounded,
              label: 'Source Code',
              isPrimary: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScreenshotCarousel(
      {required double width, required double height}) {
    final hasMultipleImages = widget.imagePaths.length > 1;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.imagePaths.length,
              onPageChanged: _onImageChanged,
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(isHovered ? 0.5 : 0.2),
                  ],
                ),
              ),
            ),
            if (hasMultipleImages)
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.imagePaths.length, (index) {
                    final isActive = index == _currentImageIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 22 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xffFF014F)
                            : Colors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    );
                  }),
                ),
              ),
            if (hasMultipleImages)
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  child: Text(
                    '${_currentImageIndex + 1}/${widget.imagePaths.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required bool isPrimary,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPrimary ? const Color(0xffFF014F) : Colors.transparent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isPrimary
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          elevation: isPrimary ? 8 : 0,
          shadowColor: const Color(0xffFF014F).withOpacity(0.5),
        ),
      ),
    );
  }
}
