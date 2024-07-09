import 'dart:io';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/config/create_text_theme.dart';
import 'package:quotez/config/theme.dart';
import 'package:quotez/features/core/core.dart';
import 'package:quotez/features/onboarding/onboarding.dart';

void main() => runApp(
      ProviderScope(
        child: DevicePreview(
          tools: const [
            ...DevicePreview.defaultTools,
            DevicePreviewScreenshot(),
          ],
          enabled: Platform.isWindows,
          builder: (context) => const MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Rubik', 'Rubik');
    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Quotez',
      theme: theme.light(),
      home: const BaseScreen(
        child: OnboardingScreen(),
      ),
    );
  }
}
