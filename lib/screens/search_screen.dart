import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';
import '../cubit/news_state.dart';
import '../ahmed/news_details_screen.dart';

import '../l10n/app_localizations.dart';


class SearchScreen extends StatelessWidget {
  final String sourceId;
  final String sourceName;

  const SearchScreen({
    super.key,
    required this.sourceId,
    required this.sourceName,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    return BlocProvider(
      create: (_) => NewsCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFF0F0F0F),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F0F0F),
          foregroundColor: Colors.white,
          elevation: 0,
          title: Text(
            l10n.searchNews,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: l10n.searchForNews,
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF5CC8E8),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF5CC8E8),
                    ),
                    onPressed: () {
                      if (controller.text.trim().isEmpty) return;

                      context.read<NewsCubit>().getNewsBySourceId(
                        sourceId: sourceId,
                        language: 'en',
                        query: controller.text.trim(),
                      );
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  if (value.trim().isEmpty) return;

                  context.read<NewsCubit>().getNewsBySourceId(
                    sourceId: sourceId,
                    language: 'en',
                    query: value.trim(),
                  );
                },
              ),

              const SizedBox(height: 20),

              Expanded(
                child: BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF5CC8E8),
                        ),
                      );
                    }

                    if (state is NewsError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    if (state is NewsSuccess) {
                      final articles =
                          state.newsResponse.articles ?? [];

                      if (articles.isEmpty) {
                        return Center(
                          child: Text(
                            l10n.noNewsFound,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final article = articles[index];

                          return Card(
                            color: const Color(0xFF1A1A1A),
                            margin: const EdgeInsets.only(bottom: 15),
                            child: ListTile(
                              title: Text(
                                article.title ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                article.description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
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
                            ),
                          );
                        },
                      );
                    }

                    return const Center(
                      child: Text(
                        'Search for news',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                        ),
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