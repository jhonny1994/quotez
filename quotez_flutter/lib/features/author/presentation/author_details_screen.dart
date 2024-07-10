import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:quotez/features/author/author.dart';
import 'package:quotez/features/core/core.dart';
import 'package:quotez/features/quote/quote.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorDetailsScreen extends ConsumerWidget {
  const AuthorDetailsScreen({
    required this.authorId,
    super.key,
  });

  final String authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final author = ref.watch(authorDetailsProvider(authorId));
    return Center(
      child: author.when(
        data: (data) => data.fold(
          (l) => Text(l),
          (r) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                r.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(r.description),
              const Divider(height: 32),
              sectionTitle(context, 'Description'),
              Text(r.bio),
              const Divider(height: 32),
              Row(
                children: [
                  iconInfo(Icons.numbers, r.quoteCount.toString()),
                  iconInfo(
                    Icons.date_range,
                    '${r.dateAdded.day}/${r.dateAdded.month}/${r.dateAdded.year}',
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(8),
                        const Icon(Icons.info),
                        TextButton(
                          child: const Text('Open link'),
                          onPressed: () async => launchUrl(
                            Uri.parse(r.link),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 32),
              if (r.quotes != null && r.quotes!.isNotEmpty)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle(context, 'Quotes'),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: r.quotes!.length,
                          itemBuilder: (context, index) =>
                              quoteCard(r.quotes![index]),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
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
