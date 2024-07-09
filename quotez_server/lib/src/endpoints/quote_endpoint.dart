import 'package:dio/dio.dart';
import 'package:quotez_server/src/endpoints/constants.dart';
import 'package:quotez_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuoteEndpoint extends Endpoint {
  Future<QuotesResult?> list(
    Session session, {
    String? sortBy,
    String? order,
    int? limit,
    int? page,
    String? slug,
  }) async {
    const authorsUrl = '/quotes';

    final queryParameters = <String, dynamic>{};
    if (sortBy != null) {
      queryParameters['sortBy'] = sortBy;
    }
    if (order != null) {
      queryParameters['order'] = order;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      queryParameters['page'] = page.toString();
    }
    if (slug != null) {
      queryParameters['slug'] = slug;
    }

    try {
      final response = await dio.get<Map<String, dynamic>>(
        authorsUrl,
        queryParameters: queryParameters,
      );

      if (response.data != null) {
        final quotesResult = QuotesResult.fromJson(response.data!);
        final newQuotesList = <Quote>[];
        for (var index = 0; index < quotesResult.results.length; index++) {
          newQuotesList.add(
            quotesResult.results.elementAt(index).copyWith(
                  id: response.data!['results'][index]['_id'] as String,
                ),
          );
        }
        return quotesResult.copyWith(results: newQuotesList);
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<QuotesResult?> search(
    Session session,
    String query,
  ) async {
    const searchUrl = 'search/quotes';
    final queryParameters = <String, dynamic>{
      'query': query,
    };

    try {
      final response = await dio.get<Map<String, dynamic>>(
        searchUrl,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final searchResult = QuotesResult.fromJson(response.data!);
        final newQuotesList = <Quote>[];
        for (var index = 0; index < searchResult.results.length; index++) {
          newQuotesList.add(
            searchResult.results.elementAt(index).copyWith(
                  id: response.data!['results'][index]['_id'] as String,
                ),
          );
        }
        return searchResult.copyWith(results: newQuotesList);
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<Quote?> get(
    Session session,
    String id,
  ) async {
    final authorsUrl = '/quotes/$id';
    try {
      final response = await dio.get<Map<String, dynamic>>(
        authorsUrl,
      );
      if (response.data != null) {
        final quote = Quote.fromJson(response.data!);
        return quote.copyWith(
          id: response.data!['_id'] as String,
        );
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<List<Quote>?> random(
    Session session, {
    int? limit,
    List<String>? tags,
  }) async {
    const quotesUrl = '/quotes/random';

    final queryParameters = <String, dynamic>{};
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (tags != null && tags.isNotEmpty) {
      queryParameters['tags'] = tags.join(',');
    }
    try {
      final response = await dio.get<List<dynamic>>(
        quotesUrl,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final quotes = response.data!
            .map(
              (e) => Quote.fromJson(e as Map<String, dynamic>).copyWith(
                id: e['_id'] as String,
              ),
            )
            .toList();
        return quotes;
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }
}
