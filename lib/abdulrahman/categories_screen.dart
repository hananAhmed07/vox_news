import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, String>> categories = [
    {
      'en': 'Technology',
      'ar': 'التكنولوجيا',
    },
    {
      'en': 'Design',
      'ar': 'التصميم',
    },
    {
      'en': 'Business',
      'ar': 'الأعمال',
    },
    {
      'en': 'Travel',
      'ar': 'السفر',
    },
    {
      'en': 'Fitness',
      'ar': 'اللياقة البدنية',
    },
    {
      'en': 'Food',
      'ar': 'الطعام',
    },
    {
      'en': 'Science',
      'ar': 'العلوم',
    },
    {
      'en': 'Finance',
      'ar': 'التمويل',
    },
    {
      'en': 'Gaming',
      'ar': 'الألعاب',
    },
    {
      'en': 'Books',
      'ar': 'الكتب',
    },
    {
      'en': 'Movies',
      'ar': 'الأفلام',
    },
    {
      'en': 'Art',
      'ar': 'الفن',
    },
    {
      'en': 'Nature',
      'ar': 'الطبيعة',
    },
  ];

  final Set<String> selectedCategories = {};

  bool isDarkMode = false;
  bool isArabic = false;

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
    final Color backgroundColor =
        isDarkMode ? const Color(0xFF121212) : const Color(0xFFF8FAFB);

    final Color cardColor =
        isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    final Color textColor =
        isDarkMode ? Colors.white : const Color(0xFF17232D);

    final Color secondaryTextColor =
        isDarkMode ? Colors.grey.shade400 : Colors.grey;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          isArabic ? 'الأقسام' : 'Categories',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: cardColor,
        foregroundColor: textColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isArabic = !isArabic;
              });
            },
            icon: const Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Directionality(
        textDirection:
            isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              Text(
                isArabic
                    ? 'اختر الأقسام'
                    : 'Choose Categories',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                isArabic
                    ? 'اختر الأقسام التي تهتم بها.'
                    : 'Choose the categories you are interested in.',
                style: TextStyle(
                  fontSize: 15,
                  color: secondaryTextColor,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.7,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    final String categoryName = isArabic
                        ? category['ar']!
                        : category['en']!;

                    final bool isSelected =
                        selectedCategories.contains(category['en']);

                    return GestureDetector(
                      onTap: () =>
                          toggleCategory(category['en']!),
                      child: AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF11B8C9)
                              : cardColor,
                          borderRadius:
                              BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF11B8C9)
                                : (isDarkMode
                                    ? Colors.grey.shade700
                                    : Colors.grey.shade300),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isDarkMode
                                  ? Colors.black.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                categoryName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : textColor,
                                ),
                              ),
                            ),

                            if (isSelected)
                              const Positioned(
                                top: 8,
                                right: 8,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: selectedCategories.isEmpty
                      ? null
                      : () {
                          Navigator.pop(context);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF11B8C9),
                    disabledBackgroundColor:
                        isDarkMode
                            ? Colors.grey.shade800
                            : Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isArabic
                        ? 'تأكيد الأقسام'
                        : 'CONFIRM CATEGORIES',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
