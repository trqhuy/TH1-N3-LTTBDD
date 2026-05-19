import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../authentication/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Jobspot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.textDark.withOpacity(0.8),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    // Placeholder for Illustration
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        size: 200,
                        color: AppColors.orangeLight,
                      ),
                    ),
                    const SizedBox(height: 40),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(text: 'Find Your\n'),
                          TextSpan(
                            text: 'Dream Job',
                            style: TextStyle(
                              color: AppColors.orangeLight,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: '\nHere!'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Explore all the most exciting job roles based on your interest and study major.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textGrey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    backgroundColor: AppColors.primary,
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
