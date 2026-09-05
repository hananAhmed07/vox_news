import 'package:flutter/material.dart';

import '../../app_settings.dart';
import '../news/news_screen.dart';

class SourcesScreen extends StatelessWidget {
  final String categoryName;

  const SourcesScreen({
    super.key,
    required this.categoryName,
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

    final List<Map<String, String>> sources = [
      {
        'en': 'BBC News',
        'ar': 'بي بي سي نيوز',
      },
      {
        'en': 'CNN',
        'ar': 'سي إن إن',
      },
      {
        'en': 'Reuters',
        'ar': 'رويترز',
      },
      {
        'en': 'Al Jazeera',
        'ar': 'الجزيرة',
      },
      {
        'en': 'The Guardian',
        'ar': 'ذا جارديان',
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),

      body: Directionality(
        textDirection:
        isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isArabic
                    ? 'اختر مصدر الأخبار'
                    : 'Choose Your Source',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                isArabic
                    ? 'اختر مصدرًا إخباريًا لرؤية أحدث المقالات.'
                    : 'Select a news source to see its latest articles.',
                style: TextStyle(
                  color: secondaryTextColor,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: sources.length,
                  itemBuilder: (context, index) {
                    final source = sources[index];

                    final String sourceName = isArabic
                        ? source['ar']!
                        : source['en']!;

                    return Card(
                      color: cardColor,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                          const Color(0xFFE8FAFC),
                          child: const Icon(
                            Icons.newspaper,
                            color: Color(0xFF11B8C9),
                          ),
                        ),

                        title: Text(
                          sourceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),

                        trailing: Icon(
                          isArabic
                              ? Icons.arrow_back_ios
                              : Icons.arrow_forward_ios,
                          size: 18,
                          color: textColor,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsScreen(
                                sourceName: source['en']!,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
