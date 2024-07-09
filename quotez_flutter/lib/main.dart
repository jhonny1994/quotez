import 'dart:io';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/config/create_text_theme.dart';
import 'package:quotez/config/shared_prefrences_provider.dart';
import 'package:quotez/config/theme.dart';
import 'package:quotez/features/core/core.dart';
import 'package:quotez/features/onboarding/onboarding.dart';
import 'package:quotez/features/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
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
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    final textTheme = createTextTheme(context, 'Rubik', 'Rubik');
    final theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Quotez',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const BaseScreen(
        child: OnboardingScreen(),
      ),
    );
  }
}
