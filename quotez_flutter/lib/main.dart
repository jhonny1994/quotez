import 'dart:convert';
import 'dart:io';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:quotez/config/client.dart';
import 'package:quotez/config/create_text_theme.dart';
import 'package:quotez/config/shared_prefrences_provider.dart';
import 'package:quotez/config/theme.dart';
import 'package:quotez/features/core/core.dart';
import 'package:quotez/features/onboarding/onboarding.dart';
import 'package:quotez_client/quotez_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  final backendUrlresponse =
      await http.get(Uri.parse('https://api.npoint.io/ea3018b39e25fc43f4c5/'));
  final backendUrl = (json.decode(backendUrlresponse.body)
      as Map<String, dynamic>)['backendUrl'] as String;

  final path = (await getApplicationDocumentsDirectory()).path;

  runApp(
    ProviderScope(
      overrides: [
        clientProvider.overrideWithValue(
          Client(backendUrl)
            ..connectivityMonitor = FlutterConnectivityMonitor(),
        ),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: DevicePreview(
        tools: [
          ...DevicePreview.defaultTools,
          DevicePreviewScreenshot(
            onScreenshot: screenshotAsFiles(Directory(path)),
          ),
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
        title: 'Quotez',
        child: OnboardingScreen(),
      ),
    );
  }
}
