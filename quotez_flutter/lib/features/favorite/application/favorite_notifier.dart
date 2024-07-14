import 'dart:convert';

import 'package:quotez/config/shared_prefrences_provider.dart';
import 'package:quotez_client/quotez_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_notifier.g.dart';

@riverpod
class FavoriteNotifier extends _$FavoriteNotifier {
  static const String favoritesKey = 'favorites';
  @override
  Future<List<Quote>> build() async {
    return get();
  }

  Future<void> toggle(Quote quote) async {
    final favorites = state.value ?? [];
    if (favorites.contains(quote)) {
      state = AsyncValue.data(favorites.where((q) => q != quote).toList());
    } else {
      state = AsyncValue.data([...favorites, quote]);
    }
    await ref
        .read(sharedPreferencesProvider)
        .setString(favoritesKey, jsonEncode(state.value));
  }

  Future<List<Quote>> get() async {
    final jsonString =
        ref.read(sharedPreferencesProvider).getString(favoritesKey);
    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((json) => Quote.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<void> clear() async {
    state = const AsyncValue.data([]);
    await ref.read(sharedPreferencesProvider).remove(favoritesKey);
  }
}
