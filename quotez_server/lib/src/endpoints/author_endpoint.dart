import 'package:dio/dio.dart';
import 'package:quotez_server/src/endpoints/constants.dart';
import 'package:quotez_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthorEndpoint extends Endpoint {
  Future<AuthorsResult?> list(
    Session session, {
    String? sortBy,
    String? order,
    int? limit,
    int? page,
    String? slug,
  }) async {
    const authorsUrl = '/authors';

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
        final authorsResult = AuthorsResult.fromJson(response.data!);
        final newAuthorsList = <Author>[];
        for (var index = 0; index < authorsResult.results.length; index++) {
          newAuthorsList.add(
            authorsResult.results.elementAt(index).copyWith(
                  id: response.data!['results'][index]['_id'] as String,
                ),
          );
        }
        return authorsResult.copyWith(results: newAuthorsList);
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<Author?> get(
    Session session,
    String id,
  ) async {
    final authorsUrl = '/authors/$id';
    try {
      final response = await dio.get<Map<String, dynamic>>(
        authorsUrl,
      );
      if (response.data != null) {
        final author = Author.fromJson(response.data!);

        final oldQuotesList = response.data!['quotes'] as List<dynamic>;

        final newQuotesList = oldQuotesList
            .map(
              (e) => Quote.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        return author.copyWith(
          id: response.data!['_id'] as String,
          quotes: newQuotesList,
        );
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<AuthorsResult?> search(
    Session session,
    String query,
  ) async {
    const searchUrl = '/search/authors';
    final queryParameters = <String, dynamic>{
      'query': query,
    };

    try {
      final response = await dio.get<Map<String, dynamic>>(
        searchUrl,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final searchResult = AuthorsResult.fromJson(response.data!);
        final newAuthorsList = <Author>[];
        for (var index = 0; index < searchResult.results.length; index++) {
          newAuthorsList.add(
            searchResult.results.elementAt(index).copyWith(
                  id: response.data!['results'][index]['_id'] as String,
                ),
          );
        }
        return searchResult.copyWith(results: newAuthorsList);
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }
}
