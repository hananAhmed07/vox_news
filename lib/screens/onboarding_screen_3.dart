import 'package:flutter/material.dart';

import 'source_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  final Set<String> selectedCategories;

  const OnboardingScreen3({
    super.key,
    required this.selectedCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Column(
          children: [
// ================= HEADER =================
            Container(
              height: 62,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
// Menu + Logo
                  Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        color: Color(0xFF0F0F0F),
                        size: 28,
                      ),

                      const SizedBox(width: 10),

                      Container(
                        width: 32,
                        height: 32,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          'assets/vox_logo.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

// HOME
                  const Text(
                    'HOME',
                    style: TextStyle(
                      color: Color(0xFF0F0F0F),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const Spacer(),

// Profile Circle
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF0F0F0F),
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_outline,
                        color: Color(0xFF0F0F0F),
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),

// ================= IMAGE =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  24,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/onboarding_3.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),

// ================= BOTTOM CONTENT =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                24,
                0,
                24,
                18,
              ),
              child: Column(
                children: [
// ================= TITLE =================
                  const Text(
                    'CHOOSE YOUR SOURCE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 10),
// ================= DESCRIPTION =================
                  const Text(
                    'Choose the news sources you trust '
                        'and stay connected with what matters.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 18),

// ================= PAGE INDICATORS =================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5CC8E8),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

// ================= GET STARTED =================
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SourcesScreen(
                              selectedCategories: selectedCategories,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5CC8E8),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}