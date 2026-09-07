import 'package:flutter/material.dart';
import '../ahmed/news_details_screen.dart';

class NewsListScreen extends StatelessWidget {
  final String sourceId;
  final String sourceName;

  const NewsListScreen({
    super.key,
    required this.sourceId,
    required this.sourceName,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> news = [
      {
        'title': 'Latest News',
        'description': 'Read the latest news and updates.',
        'image': '',
        'time': 'Today',
      },
      {
        'title': 'Technology News',
        'description': 'The latest updates in technology.',
        'image': '',
        'time': 'Today',
      },
      {
        'title': 'Business News',
        'description': 'Latest business and economic news.',
        'image': '',
        'time': 'Today',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        title: Text(
          sourceName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailsScreen(
                      title: article['title']!,
                      description: article['description']!,
                      sourceName: sourceName,
                      time: article['time']!,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.article_outlined,
                          color: Color(0xFF5CC8E8),
                          size: 50,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      article['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      article['description']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Text(
                          sourceName,
                          style: const TextStyle(
                            color: Color(0xFF5CC8E8),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          article['time']!,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}