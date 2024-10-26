import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const Text.rich(
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
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: Image.asset('assets/images/BillWiz.png'),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile Application',
                      style: TextStyle(color: Color(0xffFF014F), fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'BillWiz',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'This app lets users browse a restaurant menu, add items to their cart, and choose full or half portions. Users can adjust quantities, edit, or remove items with ease, providing a smooth and intuitive ordering experience.',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 13),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_outward,
                            color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile Application',
                      style: TextStyle(color: Color(0xffFF014F), fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Shopping App',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Integrated features include user authentication, cart management, order tracking, and secure payment options, reducing login time by 20%.',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 13),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: const Color(0xff1E1E1E),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_outward,
                            color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
             Container(
                height: 280,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: Image.asset('assets/images/Shop.png'),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: Image.asset('assets/images/Meal.png'),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile Application',
                      style: TextStyle(color: Color(0xffFF014F), fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'MealMate',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Features include a favorite section, filtering options for dietary preferences like gluten-free, lactose-free, vegan, and vegetarian recipes, as well as displaying meal duration, complexity, expenses, ingredients, and steps.',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 13),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_outward,
                            color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
