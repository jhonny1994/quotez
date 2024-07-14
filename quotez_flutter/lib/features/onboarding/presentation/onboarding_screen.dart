import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quotez/features/author/author.dart';
import 'package:quotez/features/core/core.dart';
import 'package:quotez/features/favorite/presentation/favorite_quotes_list_screen.dart';
import 'package:quotez/features/quote/quote.dart';
import 'package:quotez/features/tag/tag.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool boarded = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        boarded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return boarded
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  'Choose your next quote',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BaseScreen(
                        child: QuoteScreen(),
                      ),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  label: const Text('Quotes'),
                  icon: const Icon(Icons.format_quote),
                ),
                const Gap(8),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BaseScreen(
                        title: 'Tags',
                        child: TagScreen(),
                      ),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  label: const Text('Tags'),
                  icon: const Icon(Icons.tag),
                ),
                const Gap(8),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BaseScreen(
                        title: 'Authors',
                        child: AuthorListScreen(),
                      ),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  label: const Text('Authors'),
                  icon: const Icon(Icons.person),
                ),
                const Gap(8),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BaseScreen(
                        title: 'Favorites',
                        child: FavoriteQuotesListScreen(),
                      ),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  label: const Text('Favorites'),
                  icon: const Icon(Icons.favorite),
                ),
                const Spacer(),
              ],
            ),
          )
        : Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.66,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 175,
                        width: 175,
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                      ),
                      SizedBox(
                        height: 175,
                        width: 175,
                        child: CircularProgressIndicator(
                          strokeWidth: 8,
                          color: Colors.brown.shade300,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Quotez',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          );
  }
}
