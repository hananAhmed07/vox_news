import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';
import '../cubit/news_state.dart';
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
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getNewsBySourceId(
          sourceId: sourceId,
          language: 'en',
        ),
      child: Scaffold(
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

        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
// Loading
            if (state is NewsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF5CC8E8),
                ),
              );
            }

// Error
            if (state is NewsError) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              );
            }

// Success
            if (state is NewsSuccess) {
              final articles =
                  state.newsResponse.articles ?? [];

              if (articles.isEmpty) {
                return const Center(
                  child: Text(
                    'No news found.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 18,
                    ),
                    child: InkWell(
                      borderRadius:
                      BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsDetailsScreen(
                                  title: article.title ?? '',
                                  description:
                                  article.description ?? '',
                                  sourceName: sourceName,
                                  time:
                                  article.publishedAt ?? '',
                                  imageUrl:
                                  article.urlToImage,
                                  articleUrl: article.url,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            if (article.urlToImage != null &&
                                article.urlToImage!.isNotEmpty)
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(12),
                                child: Image.network(
                                  article.urlToImage!,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      height: 180,
                                      width: double.infinity,
                                      color: Colors.white12,
                                      child: const Icon(
                                        Icons
                                            .article_outlined,
                                        color:
                                        Color(0xFF5CC8E8),
                                        size: 50,
                                      ),
                                    );
                                  },
                                ),
                              )
                            else
                              Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.article_outlined,
                                    color:
                                    Color(0xFF5CC8E8),
                                    size: 50,
                                  ),
                                ),
                              ),

                            const SizedBox(height: 15),

                            Text(
                              article.title ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              article.description ?? '',
                              maxLines: 2,
                              overflow:
                              TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              sourceName,
                              style: const TextStyle(
                                color: Color(0xFF5CC8E8),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}