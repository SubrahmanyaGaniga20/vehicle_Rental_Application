import 'package:flutter/material.dart';
import 'package:apna_gadi/screens/home_screen.dart'; // Import HomeScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _titles = [
    "Welcome to APNA GADI",
    "Book Your Favorite Vehicle",
    "Enjoy Your Ride"
  ];

  final List<String> _descriptions = [
    "Discover the best vehicle rental options.",
    "Easy booking process with a variety of choices.",
    "Experience a smooth and convenient ride."
  ];

  final List<String> _images = [
    'assets/images/onboarding3.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png'
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onGetStarted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _titles.length,
            itemBuilder: (context, index) {
              return OnboardingContent(
                title: _titles[index],
                description: _descriptions[index],
                image: _images[index],
              );
            },
          ),
          Positioned(
            bottom: 60.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != _titles.length - 1)
                  TextButton(
                    onPressed: _onGetStarted,
                    child: const Text("SKIP"),
                  ),
                Row(
                  children: List.generate(
                    _titles.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: _currentPage == index ? 24.0 : 8.0,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                if (_currentPage == _titles.length - 1)
                  TextButton(
                    onPressed: _onGetStarted,
                    child: const Text("GET STARTED"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300.0),
          const SizedBox(height: 20.0),
          Text(
            title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
