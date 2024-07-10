import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:quotez/features/quote/quote.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuoteScreen extends ConsumerStatefulWidget {
  const QuoteScreen({this.tag, super.key});

  final String? tag;

  @override
  ConsumerState<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends ConsumerState<QuoteScreen> {
  final screenshotController = ScreenshotController();
  bool takingScreenshot = false;

  @override
  Widget build(BuildContext context) {
    final quote = ref.watch(randomQuoteProvider(tag: widget.tag));
    return Center(
      child: quote.when(
        data: (data) => data.fold(
          (l) => Text(l),
          (r) => Column(
            children: [
              Expanded(
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Card(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(16),
                            const Spacer(),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.format_quote),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                r.content,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.flip(
                                flipY: true,
                                flipX: true,
                                child: const Icon(Icons.format_quote),
                              ),
                            ),
                            Text(
                              '- ${r.author}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Gap(16),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        visualDensity: VisualDensity.compact,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                      ),
                                      onPressed: () => ref.refresh(
                                        randomQuoteProvider(tag: widget.tag),
                                      ),
                                      child: Text('#${e.replaceAll(' ', '_')}'),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const Spacer(),
                            Visibility(
                              visible: takingScreenshot,
                              child: Column(
                                children: [
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Made by',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const Gap(8),
                                      const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/logo.png'),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      const Gap(8),
                                      Text(
                                        'Quotez app',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () async {
                      final pixelRatio =
                          MediaQuery.of(context).devicePixelRatio;
                      setState(() {
                        takingScreenshot = !takingScreenshot;
                      });
                      await screenshotController
                          .capture(
                        pixelRatio: pixelRatio,
                      )
                          .then(
                        (value) async {
                          if (value != null) {
                            await Share.shareXFiles(
                              [
                                XFile.fromData(
                                  value,
                                  mimeType: 'image/png',
                                ),
                              ],
                            );
                          }
                          setState(() {
                            takingScreenshot = !takingScreenshot;
                          });
                        },
                      );
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
              const Gap(16),
            ],
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
            onPressed: () => ref.refresh(randomQuoteProvider(tag: widget.tag)),
            child: const Text('Reload'),
          );
        },
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
