import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/source_cubit.dart';
import '../cubit/source_state.dart';
import '../abdulrahman/news_list_screen.dart';

class SourcesScreen extends StatefulWidget {
  final String? categoryId;
  final Set<String>? selectedCategories;

  const SourcesScreen({
    super.key,
    this.categoryId,
    this.selectedCategories,
  });

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  String? selectedSourceId;
  String? selectedSourceName;

  @override
  Widget build(BuildContext context) {
    final String category = _getCategoryId();

    return BlocProvider(
      create: (_) =>
      SourceCubit()
        ..getSources(
          categoryId: category,
          language: 'en',
        ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),

        drawer: const Drawer(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30),

                Text(
                  'VOX',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5CC8E8),
                  ),
                ),

                SizedBox(height: 30),

                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text('Home'),
                ),

                ListTile(
                  leading: Icon(Icons.dark_mode_outlined),
                  title: Text('Dark Mode'),
                ),

                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('English / Arabic'),
                ),
              ],
            ),
          ),
        ),

        body: SafeArea(
          child: Column(
            children: [

// =========================
// TOP BAR
// =========================

              Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [

                    Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xFF0F0F0F),
                            size: 30,
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 4),

                    Container(
                      width: 38,
                      height: 38,
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/vox_logo.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const Spacer(),

                    const Text(
                      'SOURCES',
                      style: TextStyle(
                        color: Color(0xFF0F0F0F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 4,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),

// =========================
// SOURCES
// =========================

              Expanded(
                child: BlocBuilder<SourceCubit, SourceState>(
                  builder: (context, state) {
// LOADING
                    if (state is SourceLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF5CC8E8),
                        ),
                      );
                    }

// ERROR
                    if (state is SourceError) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [

                              const Icon(
                                Icons.error_outline,
                                color: Color(0xFF5CC8E8),
                                size: 55,
                              ),

                              const SizedBox(height: 15),

                              const Text(
                                'Something went wrong',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<SourceCubit>()
                                      .getSources(
                                    categoryId: category,
                                    language: 'en',
                                  );
                                },
                                style:
                                ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xFF5CC8E8),
                                ),
                                child: const Text(
                                  'TRY AGAIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

// SUCCESS
                    if (state is SourceSuccess) {
                      final sources = state.sources;

                      if (sources.isEmpty) {
                        return const Center(
                          child: Text(
                            'No sources found.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          38,
                          20,
                          30,
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            const Text(
                              'Sources',
                              style: TextStyle(
                                color: Color(0xFF0F0F0F),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration:
                                  const BoxDecoration(
                                    color: Color(0xFF168CA5),
                                    shape: BoxShape.circle,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Text(
                                  _getCategoryName(),
                                  style: const TextStyle(
                                    color: Color(0xFF303030),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 55),

                            GridView.builder(
                              shrinkWrap: true,
                              physics:
                              const NeverScrollableScrollPhysics(),
                              itemCount: sources.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 22,
                                mainAxisSpacing: 24,
                                childAspectRatio: 0.95,
                              ),
                              itemBuilder: (context, index) {
                                final source = sources[index];

                                return _sourceCard(
                                  name: source.name ?? 'Unknown',
                                  sourceId: source.id ?? '',
                                );
                              },
                            ),

                            const SizedBox(height: 35),

                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed:
                                selectedSourceId == null
                                    ? null
                                    : () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NewsListScreen(
                                            sourceId:
                                            selectedSourceId!,
                                            sourceName:
                                            selectedSourceName ??
                                                '',
                                          ),
                                    ),
                                  );
                                },
                                style:
                                ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xFF5CC8E8),
                                  disabledBackgroundColor:
                                  Colors.grey.shade300,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'CONTINUE',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// ============================================================
// SOURCE CARD
// ============================================================

  Widget _sourceCard({
    required String name,
    required String sourceId,
  }) {
    final bool isSelected =
        selectedSourceId == sourceId;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSourceId = sourceId;
          selectedSourceName = name;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF5CC8E8)
              : Colors.white,

          borderRadius: BorderRadius.circular(28),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Stack(
          children: [

// =========================
// CHECK ICON
// =========================

            if (isSelected)
              Positioned(
                top: 18,
                right: 18,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF0F0F0F),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 18,
                    color: Color(0xFF0F0F0F),
                  ),
                ),
              ),

// =========================
// LOGO + NAME
// =========================

            Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Container(
                    width: 105,
                    height: 105,
                    padding: const EdgeInsets.all(18),

                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.public,
                      color: Color(0xFF168CA5),
                      size: 45,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow:
                      TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF0F0F0F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
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


// ============================================================
// CATEGORY ID
// ============================================================

  String _getCategoryId() {
    if (widget.categoryId != null &&
        widget.categoryId!.isNotEmpty) {
      return widget.categoryId!.toLowerCase();
    }

    if (widget.selectedCategories != null &&
        widget.selectedCategories!.isNotEmpty) {
      return _convertCategoryToApiValue(
        widget.selectedCategories!.first,
      );
    }

    return 'general';
  }

// ============================================================
// CATEGORY NAME
// ============================================================

  String _getCategoryName() {
    final category = _getCategoryId();

    switch (category) {
      case 'business':
        return 'BUSINESS';

      case 'technology':
        return 'TECHNOLOGY';

      case 'sports':
        return 'SPORTS';

      case 'entertainment':
        return 'ENTERTAINMENT';

      case 'health':
        return 'HEALTH';

      case 'science':
        return 'SCIENCE';

      default:
        return 'GENERAL';
    }
  }

// ============================================================
// CATEGORY CONVERSION
// ============================================================

  String _convertCategoryToApiValue(String category) {
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

      case 'politics':
      case 'culture':
        return 'general';

      default:
        return 'general';
    }
  }
}