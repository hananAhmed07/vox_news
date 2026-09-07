import 'package:flutter/material.dart';

import 'onboarding_screen_3.dart';

class OnboardingScreen2 extends StatelessWidget {
  final Set<String> selectedCategories;

  const OnboardingScreen2({
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

// =====================================================
// HEADER
// =====================================================
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

// =====================================================
// IMAGE
// =====================================================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  24, // مسافة من الهيدر
                  24, // مسافة فوق الصورة
                  24, // مسافة من اليمين
                  24, // مسافة من الكلام اللي تحت
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/onboarding_2.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),

// =====================================================
// BOTTOM INFORMATION
// =====================================================
            Container(
              width: double.infinity,
              color: const Color(0xFF0F0F0F),
              padding: const EdgeInsets.fromLTRB(
                24,
                28,
                24,
                18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

// STAY INFORMED
                  const Text(
                    'Stay Informed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 10),

// Description
                  const Text(
                    'Get the latest news from around the world '
                        'in one beautiful place.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),

// =================================================
// PAGE INDICATORS
// =================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _indicator(false),
                      const SizedBox(width: 7),
                      _indicator(true),
                      const SizedBox(width: 7),
                      _indicator(false),
                    ],
                  ),

                  const SizedBox(height: 18),

// =================================================
// NEXT BUTTON - RIGHT
// =================================================
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreen3(
                                selectedCategories: selectedCategories,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF5CC8E8),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'NEXT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 7),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
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

// =====================================================
// PAGE INDICATOR
// =====================================================
  Widget _indicator(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 26 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF5CC8E8)
            : Colors.white38,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}