import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotez/config/shared_prefrences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(ref.read(sharedPreferencesProvider)),
);

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier(this.prefs) : super(false) {
    _init();
  }
  final SharedPreferences prefs;

  Future<void> toggle() async {
    state = !state;
    await prefs.setBool('darkMode', state);
  }

  Future<void> _init() async {
    final darkMode = prefs.getBool('darkMode');
    state = darkMode ?? false;
  }
}
