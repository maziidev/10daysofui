import 'package:flutter/material.dart';
import 'package:onboarding_screen/intro_screens/intro_page.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  List<Widget> _buildPages() {
    return [
      const IntroPage(
        heading: 'Products you love',
        imagePath: 'assets/doodle_life.png',
        subHeading:
            'Grow your business by accepting card payments with a new card reader',
      ),
      const IntroPage(
        heading: 'Instant Notifications',
        imagePath: 'assets/doodle_hurry.png',
        subHeading:
            'Instant notifications let you quickly see what your favorite stores have shared',
      ),
      const IntroPage(
        heading: 'Smart Point Of Sale',
        imagePath: 'assets/doodle_swift.png',
        subHeading:
            'Smart point of sale system let you grow your business in the most effective way',
      ),
    ];
  }

  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: _buildPages(),
          ),
          Positioned(
            bottom: 150,
            right: 100,
            left: 100,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                    activeDotColor: Colors.pink,
                    activeDotScale: 1.2,
                    dotColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: CircularProgressIndicator(
                        value: (currentIndex + 1) / 3,
                        color: Colors.pink,
                        backgroundColor: const Color.fromRGBO(209, 209, 209, 1),
                        strokeWidth: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentIndex == 2) {
                            //
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.all(30)),
                        child: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
