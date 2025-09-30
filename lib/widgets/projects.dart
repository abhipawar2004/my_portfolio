import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 768;
    double margin = isMobile ? 16 : 50;
    double spacing = isMobile ? 50 : 100;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Column(
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Explore My Popular ',
                  style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontSize: isMobile ? 28 : 34),
                ),
                TextSpan(
                  text: 'Projects',
                  style: TextStyle(
                      color: const Color(0xffFF014F),
                      fontSize: isMobile ? 28 : 34),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          ProjectRow(
            title: 'BillWiz',
            description:
                'This app lets users browse a restaurant menu, add items to their cart, and choose full or half portions. Users can adjust quantities, edit, or remove items with ease, providing a smooth and intuitive ordering experience.',
            imagePath: 'assets/images/BillWiz.png',
            isMobile: isMobile,
          ),
          SizedBox(height: spacing),
          ProjectRow(
            title: 'Shopping App',
            description:
                'Integrated features include user authentication, cart management, order tracking, and secure payment options, reducing login time by 20%.',
            imagePath: 'assets/images/Shop.png',
            reverseLayout: !isMobile, // No reverse layout on mobile
            isMobile: isMobile,
          ),
          SizedBox(height: spacing),
          ProjectRow(
            title: 'MealMate',
            description:
                'Features include a favorite section, filtering options for dietary preferences like gluten-free, lactose-free, vegan, and vegetarian recipes, as well as displaying meal duration, complexity, expenses, ingredients, and steps.',
            imagePath: 'assets/images/Meal.png',
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }
}

class ProjectRow extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool reverseLayout;
  final bool isMobile;

  const ProjectRow({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.reverseLayout = false,
    this.isMobile = false,
  });

  @override
  _ProjectRowState createState() => _ProjectRowState();
}

class _ProjectRowState extends State<ProjectRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _scaleAnimation;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Color Tween Animation
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black.withOpacity(0.4),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.02).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
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

  @override
  Widget build(BuildContext context) {
    double imageWidth =
        widget.isMobile ? MediaQuery.of(context).size.width - 64 : 380;
    double imageHeight = widget.isMobile ? 200 : 280;

    final imageWidget = MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          children: [
            Container(
              height: imageHeight,
              width: imageWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(widget.imagePath, fit: BoxFit.cover),
              ),
            ),
            AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) => Container(
                height: imageHeight,
                width: imageWidth,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final textWidget = widget.isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile Application',
                style: TextStyle(
                    color: const Color(0xffFF014F),
                    fontSize: widget.isMobile ? 12 : 13),
              ),
              SizedBox(height: widget.isMobile ? 15 : 20),
              Text(
                widget.title,
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: widget.isMobile ? 28 : 32),
              ),
              SizedBox(height: widget.isMobile ? 15 : 20),
              Text(
                widget.description,
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: widget.isMobile ? 14 : 13),
              ),
              SizedBox(height: widget.isMobile ? 30 : 50),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1E1E1E),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.arrow_outward, color: Color(0xffFFFFFF)),
                ),
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mobile Application',
                  style: TextStyle(color: Color(0xffFF014F), fontSize: 13),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style:
                      const TextStyle(color: Color(0xffFFFFFF), fontSize: 32),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.description,
                  style:
                      const TextStyle(color: Color(0xffFFFFFF), fontSize: 13),
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1E1E1E),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_outward,
                        color: Color(0xffFFFFFF)),
                  ),
                ),
              ],
            ),
          );

    if (widget.isMobile) {
      // Mobile layout - always vertical
      return Column(
        children: [
          imageWidget,
          const SizedBox(height: 20),
          textWidget,
        ],
      );
    } else {
      // Desktop layout - horizontal
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.reverseLayout
            ? [textWidget, const SizedBox(width: 50), imageWidget]
            : [imageWidget, const SizedBox(width: 50), textWidget],
      );
    }
  }
}
