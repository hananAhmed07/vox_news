import 'package:flutter/material.dart';
import 'news_list_screen.dart';

class SourcesScreen extends StatelessWidget {
  final String categoryId;

  const SourcesScreen({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sources = [
      {
        'name': 'BBC News',
        'id': 'bbc-news',
      },
      {
        'name': 'CNN',
        'id': 'cnn',
      },
      {
        'name': 'TechCrunch',
        'id': 'techcrunch',
      },
      {
        'name': 'Wired',
        'id': 'wired',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        title: const Text(
          'Sources',
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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryId,
              style: const TextStyle(
                color: Color(0xFF5CC8E8),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Choose a News Source',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Select a source to read its latest news.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: sources.length,
                itemBuilder: (context, index) {
                  final source = sources[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsListScreen(
                              sourceId: source['id']!,
                              sourceName: source['name']!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white12,
                          ),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFF5CC8E8),
                              child: Icon(
                                Icons.public,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Text(
                                source['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF5CC8E8),
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
}