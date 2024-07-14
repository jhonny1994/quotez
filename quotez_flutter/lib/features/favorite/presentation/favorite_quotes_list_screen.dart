import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/features/favorite/favorite.dart';
import 'package:quotez/features/quote/quote.dart';

class FavoriteQuotesListScreen extends ConsumerStatefulWidget {
  const FavoriteQuotesListScreen({super.key});

  @override
  ConsumerState<FavoriteQuotesListScreen> createState() =>
      _FavoriteQuotesListScreenState();
}

class _FavoriteQuotesListScreenState
    extends ConsumerState<FavoriteQuotesListScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteNotifierProvider);
    return Center(
      child: favorites.when(
        data: (data) => data.isEmpty
            ? const Text('No favorite quotes')
            : Stack(
                children: [
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final quote = data[index];
                      return quoteCard(
                        quote,
                        isFavorite: true,
                        onTap: () => ref
                            .read(favoriteNotifierProvider.notifier)
                            .toggle(quote)
                            .whenComplete(
                              () => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Quote removed from favorites'),
                                ),
                              ),
                            ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: () =>
                          ref.read(favoriteNotifierProvider.notifier).clear(),
                      child: const Icon(Icons.clear),
                    ),
                  ),
                ],
              ),
        error: (error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    error.toString(),
                  ),
                ),
              );
          });
          return FilledButton(
            onPressed: () => ref.refresh(favoriteNotifierProvider),
            child: const Text('Reload'),
          );
        },
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
