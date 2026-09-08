import 'package:flutter/material.dart';

import '../screens/source_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, String>> categories = const [
    {
      'name': 'General',
      'icon': '📰',
    },
    {
      'name': 'Business',
      'icon': '💼',
    },
    {
      'name': 'Technology',
      'icon': '💻',
    },
    {
      'name': 'Sports',
      'icon': '⚽',
    },
    {
      'name': 'Entertainment',
      'icon': '🎬',
    },
    {
      'name': 'Health',
      'icon': '❤️',
    },
    {
      'name': 'Science',
      'icon': '🔬',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

// ================= APP BAR =================

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

// ================= BODY =================

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a Category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Select a category to discover related news.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

// ================= CATEGORIES =================

            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: InkWell(
                      borderRadius:
                      BorderRadius.circular(15),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SourcesScreen(
                                  categoryId:
                                  _getCategoryId(
                                    category['name']!,
                                  ),
                                ),
                          ),
                        );
                      },

                      child: Container(
                        width: double.infinity,
                        padding:
                        const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color:
                          const Color(0xFF1A1A1A),
                          borderRadius:
                          BorderRadius.circular(15),
                          border: Border.all(
                            color:
                            const Color(0xFF5CC8E8),
                            width: 1,
                          ),
                        ),

                        child: Row(
                          children: [
                            Text(
                              category['icon']!,
                              style:
                              const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(width: 20),

                            Expanded(
                              child: Text(
                                category['name']!,
                                style:
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),

                            const Icon(
                              Icons.arrow_forward_ios,
                              color:
                              Color(0xFF5CC8E8),
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

// ================= CATEGORY ID =================

  String _getCategoryId(String category) {
    switch (category.toLowerCase()) {
      case 'general':
        return 'general';

      case 'business':
        return 'business';

      case 'technology':
        return 'technology';

      case 'sports':
        return 'sports';

      case 'entertainment':
        return 'entertainment';

      case 'health':
        return 'health';

      case 'science':
        return 'science';

      default:
        return 'general';
    }
  }
}