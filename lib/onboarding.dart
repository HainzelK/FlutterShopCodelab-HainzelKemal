import 'package:codelabs101/color.dart';
import 'package:codelabs101/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnboardingPage extends StatelessWidget {
  final String lottieAsset;
  final String title;
  final String description;
  final VoidCallback onNext;

  const OnboardingPage({
    Key? key,
    required this.lottieAsset,
    required this.title,
    required this.description,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Lottie animation
        Center(
          child: Lottie.asset(
            lottieAsset,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        // Next Button with right arrow
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            foregroundColor: hitam,
            backgroundColor: kuning,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Next'),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // PageController for managing PageView
  final PageController _pageController = PageController();
  
  // List of onboarding pages with Lottie animation paths
  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to ShoeHub',
      'description': 'Explore the best collection of shoes at your fingertips.',
      'lottie': 'shoe2.json', 
    },
    {
      'title': 'Find Your Perfect Pair',
      'description': 'Browse through our curated selection of footwear.',
      'lottie': 'shoe1.json', 
    },
    {
      'title': 'Get Fast Delivery',
      'description': 'Order now and get your shoes delivered in no time!',
      'lottie': 'shoe3.json', 
    },
  ];

  // Function to handle page change
  void _onPageChange(int index) async {
  if (index == onboardingData.length - 1) {
    // Save the onboarding completion status
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'ShoeHub')),
    );
  } else {
    // Move to the next page
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return OnboardingPage(
            title: onboardingData[index]['title']!,
            description: onboardingData[index]['description']!,
            lottieAsset: onboardingData[index]['lottie']!,
            onNext: () => _onPageChange(index),
          );
        },
      ),
    );
  }
}
