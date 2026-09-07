import 'package:flutter/material.dart';

import 'onboarding_screen_2.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final Set<String> selectedCategories = {};

  final List<String> categories = [
    'Politics',
    'Technology',
    'Business',
    'Science',
    'Culture',
    'Sports',
  ];

  void toggleCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Stack(
          children: [
// =========================
// TOP IMAGE
// =========================
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                height: 530,
                child: Image.asset(
                  'assets/onboarding_1.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),

// =========================
// WHITE CURVED SECTION
// =========================
            Positioned(
              top: 430,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  25,
                  60,
                  25,
                  20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
// =========================
// TITLE
// =========================
                    const Text(
                      'Explore Categories',
                      style: TextStyle(
                        color: Color(0xFF0F0F0F),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Choose the topics you care about.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

// =========================
// CATEGORIES
// =========================
                    Wrap(
                      spacing: 10,
                      runSpacing: 12,
                      children: categories.map((category) {
                        final bool isSelected =
                        selectedCategories.contains(category);

                        return GestureDetector(
                          onTap: () => toggleCategory(category),
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 200,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 17,
                              vertical: 11,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF5CC8E8)
                                  : const Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF5CC8E8)
                                    : Colors.black12,
                              ),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.black
                                    : Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const Spacer(),

                    // =========================
                    // PAGE INDICATORS
                    // =========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5CC8E8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 6),
                        _indicator(),
                        const SizedBox(width: 6),
                        _indicator(),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // =========================
                    // NEXT BUTTON
                    // =========================
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreen2(
                                selectedCategories: selectedCategories,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'NEXT →',
                          style: TextStyle(
                            color: Color(0xFF5CC8E8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// =========================
// PAGE INDICATOR
// =========================
  Widget _indicator() {
    return Container(
      width: 8,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}