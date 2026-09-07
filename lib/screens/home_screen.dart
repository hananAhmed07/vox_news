import 'package:flutter/material.dart';

import '../abdulrahman/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'General',
      'Business',
      'Technology',
      'Sports',
      'Entertainment',
      'Health',
      'Science',
    ];

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

// ================= DRAWER =================
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(6),
                ),
                child: Image.asset(
                  'assets/vox_logo.jpg',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'VOX',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              const Divider(),

              ListTile(
                leading:
                const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading:
                const Icon(Icons.language),
                title:
                const Text('English / العربية'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.dark_mode_outlined,
                ),
                title: const Text(
                  'Light / Dark Mode',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),

// ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
// ================= HEADER =================
              Row(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.menu,
                          size: 28,
                        ),
                        onPressed: () {
                          Scaffold.of(context)
                              .openDrawer();
                        },
                      );
                    },
                  ),

                  const Spacer(),

                  Container(
                    width: 42,
                    height: 42,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    child: Image.asset(
                      'assets/vox_logo.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 10),
                  Text(
                    'VOX',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 27,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

// ================= LATEST NEWS =================
              Text(
                'Latest News',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface,
                ),
              ),

              const SizedBox(height: 20),

// ================= CATEGORIES =================
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection:
                  Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder:
                      (context, index) {
                    return Padding(
                      padding:
                      const EdgeInsets.only(
                        right: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const CategoriesScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration:
                          BoxDecoration(
                            color: index == 0
                                ? const Color(
                              0xFF5CC8E8,
                            )
                                : Theme.of(context)
                                .colorScheme
                                .surface,
                            borderRadius:
                            BorderRadius.circular(
                              20,
                            ),
                            border: Border.all(
                              color: index == 0
                                  ? const Color(
                                0xFF5CC8E8,
                              )
                                  : Colors.black12,
                            ),
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: index == 0
                                  ? Colors.black
                                  : Theme.of(context)
                                  .colorScheme
                                  .onSurface,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
// ================= NEWS CARDS =================
              _newsCard(
                context,
                title:
                'Latest News From Around The World',
                source: 'VOX News',
                time: '2 hours ago',
                image:
                'https://images.unsplash.com/photo-1504711434969-e33886168f5c',
              ),

              const SizedBox(height: 18),

              _newsCard(
                context,
                title:
                'Technology Continues To Shape Our Future',
                source: 'Tech News',
                time: '4 hours ago',
                image:
                'https://images.unsplash.com/photo-1518770660439-4636190af475',
              ),

              const SizedBox(height: 18),

              _newsCard(
                context,
                title:
                'Global Business And Market Updates',
                source: 'Business News',
                time: '6 hours ago',
                image:
                'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a',
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

// ================= NEWS CARD =================

  Widget _newsCard(
      BuildContext context, {
        required String title,
        required String source,
        required String time,
        required String image,
      }) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(18),
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .surface,
          borderRadius:
          BorderRadius.circular(18),
        ),
        clipBehavior:
        Clip.antiAlias,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
// Image
            Image.network(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color:
                  const Color(0xFFE5E5E5),
                  child: const Icon(
                    Icons
                        .image_not_supported_outlined,
                    size: 50,
                    color:
                    Color(0xFF5CC8E8),
                  ),
                );
              },
            ),

            Padding(
              padding:
              const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow:
                    TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                      height: 1.3,
                      color:
                      Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Text(
                        source,
                        style:
                        const TextStyle(
                          color:
                          Color(0xFF5CC8E8),
                          fontWeight:
                          FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),

                      const Spacer(),
                      Text(
                        time,
                        style: TextStyle(
                          color:
                          Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(
                              0.55),
                          fontSize: 12,
                        ),
                      ),
                    ],
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