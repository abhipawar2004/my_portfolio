import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: const Column(
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Explore My Popular ',
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 34),
                ),
                TextSpan(
                  text: 'Projects',
                  style: TextStyle(color: Color(0xffFF014F), fontSize: 34),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          ProjectRow(
            title: 'BillWiz',
            description:
                'This app lets users browse a restaurant menu, add items to their cart, and choose full or half portions. Users can adjust quantities, edit, or remove items with ease, providing a smooth and intuitive ordering experience.',
            imagePath: 'assets/images/BillWiz.png',
          ),
          SizedBox(height: 100),
          ProjectRow(
            title: 'Shopping App',
            description:
                'Integrated features include user authentication, cart management, order tracking, and secure payment options, reducing login time by 20%.',
            imagePath: 'assets/images/Shop.png',
            reverseLayout: true,
          ),
          SizedBox(height: 100),
          ProjectRow(
            title: 'MealMate',
            description:
                'Features include a favorite section, filtering options for dietary preferences like gluten-free, lactose-free, vegan, and vegetarian recipes, as well as displaying meal duration, complexity, expenses, ingredients, and steps.',
            imagePath: 'assets/images/Meal.png',
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

  const ProjectRow({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.reverseLayout = false,
  });

  @override
  _ProjectRowState createState() => _ProjectRowState();
}

class _ProjectRowState extends State<ProjectRow> with SingleTickerProviderStateMixin {
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

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(CurvedAnimation(
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
    final imageWidget = MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          children: [
            Container(
              height: 280,
              width: 380,
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
                height: 280,
                width: 380,
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

    final textWidget = Expanded(
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
            style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 32),
          ),
          const SizedBox(height: 20),
          Text(
            widget.description,
            style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 13),
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff1E1E1E),
              borderRadius: BorderRadius.circular(60),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_outward, color: Color(0xffFFFFFF)),
            ),
          ),
        ],
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.reverseLayout
          ? [textWidget, const SizedBox(width: 50), imageWidget]
          : [imageWidget, const SizedBox(width: 50), textWidget],
    );
  }
}
