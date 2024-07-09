import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:quotez/features/quote/quote.dart';

class RandomQuoteScreen extends ConsumerWidget {
  const RandomQuoteScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.watch(randomQuoteProvider);
    return Center(
      child: quote.when(
        data: (data) => data.fold(
          (l) => Text(l),
          (r) => SizedBox.expand(
            child: Card(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: r.tags
                          .map(
                            (e) => OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                              ),
                              onPressed: () {},
                              child: Text('#${e.replaceAll(' ', '_')}'),
                            ),
                          )
                          .toList(),
                    ),
                    const Spacer(flex: 2),
                    Text(
                      r.content,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Spacer(),
                    Text(
                      '- ${r.author}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.filled(
                          onPressed: () {
                            //TODO: add share logic
                          },
                          icon: const Icon(
                            Icons.share,
                          ),
                        ),
                        const Gap(16),
                        IconButton.filled(
                          onPressed: () {
                            //TODO: add favorite logic
                          },
                          icon: const Icon(
                            Icons.favorite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        error: (error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.toString(),
                ),
              ),
            );
          });
          return FilledButton(
            onPressed: () {
              //TODO: add reload logic
            },
            child: const Text('Reload'),
          );
        },
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
