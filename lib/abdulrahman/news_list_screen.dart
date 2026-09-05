import 'package:flutter/material.dart';

import '../../app_settings.dart';
import 'news_details_screen.dart';

class NewsScreen extends StatelessWidget {
  final String sourceName;

  const NewsScreen({
    super.key,
    required this.sourceName,
  });

  @override
  Widget build(BuildContext context) {
    final settings = AppSettings.instance;

    final bool isDarkMode = settings.isDarkMode;
    final bool isArabic = settings.isArabic;

    final Color backgroundColor =
    isDarkMode ? const Color(0xFF121212) : const Color(0xFFF8FAFB);

    final Color cardColor =
    isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    final Color textColor =
    isDarkMode ? Colors.white : const Color(0xFF17232D);

    final Color secondaryTextColor =
    isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600;

    final List<Map<String, String>> articles = [
      {
        'titleEn': 'Latest News Around the World',
        'titleAr': 'أحدث الأخبار حول العالم',
        'descriptionEn':
        'Stay updated with the latest breaking news and important stories.',
        'descriptionAr':
        'ابقَ على اطلاع بأحدث الأخبار العاجلة والقصص المهمة حول العالم.',
      },
      {
        'titleEn': 'Technology Is Changing Our Future',
        'titleAr': 'التكنولوجيا تغير مستقبلنا',
        'descriptionEn':
        'Discover the latest developments and innovations in technology.',
        'descriptionAr':
        'اكتشف أحدث التطورات والابتكارات في مجال التكنولوجيا.',
      },
      {
        'titleEn': 'Important Stories You Should Know',
        'titleAr': 'قصص مهمة يجب أن تعرفها',
        'descriptionEn':
        'Here are some of the most important stories happening today.',
        'descriptionAr':
        'إليك بعض أهم القصص والأحداث التي تحدث اليوم.',
      },
      {
        'titleEn': 'New Updates From Around the World',
        'titleAr': 'تحديثات جديدة من جميع أنحاء العالم',
        'descriptionEn':
        'Read the latest updates from trusted news sources.',
        'descriptionAr':
        'اقرأ أحدث التحديثات من مصادر إخبارية موثوقة.',
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text(sourceName),
        centerTitle: true,
      ),

      body: Directionality(
        textDirection:
        isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];

            final String title = isArabic
                ? article['titleAr']!
                : article['titleEn']!;

            final String description = isArabic
                ? article['descriptionAr']!
                : article['descriptionEn']!;

            return Card(
              color: cardColor,
              margin: const EdgeInsets.only(bottom: 16),
              elevation: isDarkMode ? 1 : 3,

              child: InkWell(
                borderRadius: BorderRadius.circular(12),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                        title: title,
                        description: description,
                      ),
                    ),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      // =========================
                      // NEWS IMAGE
                      // =========================
                      Container(
                        height: 180,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? const Color(0xFF2A2A2A)
                              : Colors.grey.shade200,

                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: Icon(
                          Icons.image,
                          size: 60,
                          color: isDarkMode
                              ? Colors.grey.shade600
                              : Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // =========================
                      // TITLE
                      // =========================
                      Text(
                        title,

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // =========================
                      // DESCRIPTION
                      // =========================
                      Text(
                        description,

                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
