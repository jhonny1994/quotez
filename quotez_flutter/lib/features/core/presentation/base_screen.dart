import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotez/features/core/application/connectivity_notifier.dart';
import 'package:quotez/features/core/core.dart';

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
    final connectivity = ref.watch(connectivityProvider);
    return Scaffold(
      appBar: AppBar(
        title: title == null
            ? const CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                backgroundColor: Colors.transparent,
              )
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
          child: Center(
            child: connectivity.when(
              data: (internetConnectionStatus) {
                if (internetConnectionStatus ==
                    InternetConnectionStatus.connected) {
                  return child;
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('No internet connection'),
                      const Gap(8),
                      FilledButton(
                        onPressed: () => ref.refresh(connectivityProvider),
                        child: const Text('Reload'),
                      ),
                    ],
                  );
                }
              },
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
                  onPressed: () => ref.refresh(connectivityProvider),
                  child: const Text('Reload'),
                );
              },
              loading: () => const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
