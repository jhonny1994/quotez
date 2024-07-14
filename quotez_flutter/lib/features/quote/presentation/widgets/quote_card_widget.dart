import 'package:flutter/material.dart';
import 'package:quotez_client/quotez_client.dart';

Widget quoteCard(
  Quote quote, {
  bool isFavorite = false,
  VoidCallback? onTap,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.format_quote),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    quote.content,
                    textAlign: TextAlign.center,
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
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: quote.tags
                      .map(
                        (e) => Text('#${e.replaceAll(' ', '_')}'),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          if (isFavorite)
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.favorite),
            ),
        ],
      ),
    ),
  );
}
