import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/features/theme/theme.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({
    required this.child,
    this.title,
    super.key,
  });
  final Widget child;
  final String? title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: title == null
            ? null
            : Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.nightlight),
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: child,
        ),
      ),
    );
  }
}
