import 'package:flutter/material.dart';

import '../abdulrahman/categories_screen.dart';

import '../l10n/app_localizations.dart';

import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  final Future<void> Function(bool) onThemeChanged;
  final Future<void> Function(String) onLanguageChanged;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    final categories = [
      l10n.general,
      l10n.business,
      l10n.technology,
      l10n.sports,
      l10n.entertainment,
      l10n.health,
      l10n.science,
    ];

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

// ================= DRAWER =================
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.72,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 25),

              // VOX NEWS
              Row(
                children: [
                  const SizedBox(width: 28),

                  Container(
                    width: 62,
                    height: 62,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/vox_logo.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VOX',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        'NEWS',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 35),

              const Divider(
                height: 1,
                color: Colors.black12,
              ),

              // HOME
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 22,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.home_outlined,
                        color: Color(0xFF0F0F0F),
                        size: 28,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        l10n!.home,
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(
                height: 1,
                color: Colors.black12,
              ),

              const SizedBox(height: 25),

              // THEME
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.wb_sunny_outlined,
                      color: Color(0xFF0F0F0F),
                      size: 30,
                    ),

                    const SizedBox(width: 20),

                    const Expanded(
                      child: Text(
                        'THEME',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    // THEME TOGGLE
                    Container(
                      width: 82,
                      height: 45,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onThemeChanged(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                      Brightness.light
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Color(0xFF5CC8E8),
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onThemeChanged(true);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.nightlight_outlined,
                                    color: Color(0xFF0F0F0F),
                                    size: 21,
                                  ),
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

              const SizedBox(height: 10),

              // LANGUAGE
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Color(0xFF0F0F0F),
                      size: 30,
                    ),

                    const SizedBox(width: 20),

                    const Expanded(
                      child: Text(
                        'LANGUAGE',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    // LANGUAGE TOGGLE
                    Container(
                      width: 120,
                      height: 45,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onLanguageChanged('en');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                  Localizations.localeOf(context)
                                      .languageCode ==
                                      'en'
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius:
                                  BorderRadius.circular(22),
                                ),
                                child: const Center(
                                  child: Text(
                                    'EN',
                                    style: TextStyle(
                                      color: Color(0xFF2B7F91),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onLanguageChanged('ar');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                  Localizations.localeOf(context)
                                      .languageCode ==
                                      'ar'
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius:
                                  BorderRadius.circular(22),
                                ),
                                child: const Center(
                                  child: Text(
                                    'AR',
                                    style: TextStyle(
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
                    padding:
                    const EdgeInsets.all(8),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchScreen(
                            sourceId: 'bbc-news',
                            sourceName: 'BBC News',
                          ),
                        ),
                      );
                    },
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
                l10n.latestNews,
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

              // ================= NEWS CARD 3 =================
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
                            0.55,
                          ),
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