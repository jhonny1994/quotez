import 'package:flutter/material.dart';

Widget sectionTitle(BuildContext context, String title) {
  return Text(
    title,
    style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
  );
}
