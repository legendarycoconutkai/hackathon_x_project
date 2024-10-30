// This file contains the implementation of the OnboardingScreen widget, which
// is a stateful widget that displays a series of onboarding pages to the user.
//
// The OnboardingScreen consists of:
// - A PageView that allows the user to swipe through different onboarding pages.
// - A row of dots at the bottom of the screen indicating the current page.
// - A "Get Started" button that navigates to the Profile screen when the user
//   reaches the last onboarding page.
//
// The OnboardingPage is a stateless widget that represents a single page in the
// onboarding flow. Each OnboardingPage displays an image, a title, and a description.
import 'package:flutter/material.dart';
import 'package:hackathon_x_project/page/profile.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [
              OnboardingPage(
                image: 'assets/images/privatespace.png',
                title: 'Your Private Space',
                description: 'Record your thoughts and track how you feel in a safe, private diary.',
              ),
              OnboardingPage(
                image: 'assets/images/under.png',
                title: 'AI That Understands You',
                description: 'Have an AI that cares for you like a friend. It adapts to your style, offering support that feels personal.',
              ),
              OnboardingPage(
                image: 'assets/images/journaling.png',
                title: 'Effortless Diarying',
                description: 'Let the AI summarize your conversations into diary entries, making it easy to reflect and grow.',
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index)),
            ),
          ),
          if (_currentPage == 2)
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: const Text("Get Started"),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({super.key, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
