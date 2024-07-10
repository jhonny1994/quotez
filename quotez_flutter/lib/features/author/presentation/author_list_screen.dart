import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/features/author/author.dart';
import 'package:quotez/features/core/core.dart';

class AuthorListScreen extends ConsumerWidget {
  const AuthorListScreen({super.key});

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
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BaseScreen(
                    child: AuthorDetailsScreen(
                      authorId: r.results[index].id!,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
            onPressed: () => ref.refresh(authorListProvider),
            child: const Text('Reload'),
          );
        },
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
