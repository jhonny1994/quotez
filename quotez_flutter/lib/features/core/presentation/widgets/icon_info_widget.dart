import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget iconInfo(IconData icon, String text) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(8),
        Icon(icon),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
