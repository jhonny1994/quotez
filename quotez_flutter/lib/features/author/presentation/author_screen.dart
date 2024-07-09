import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/features/author/author.dart';

class AuthorScreen extends ConsumerWidget {
  const AuthorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(authorListProvider);
    return Center(
      child: tags.when(
        data: (data) => data.fold(
          (l) => Text(l),
          (r) => ListView.builder(
            itemCount: r.results.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(r.results[index].name),
              subtitle: Text(r.results[index].description),
              leading: Text(r.results[index].quoteCount.toString()),
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
