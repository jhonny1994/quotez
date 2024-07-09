import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    this.title,
    super.key,
  });
  final Widget child;
  final String? title;
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
