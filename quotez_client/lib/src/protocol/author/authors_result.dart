/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class AuthorsResult implements _i1.SerializableModel {
  AuthorsResult._({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    this.lastItemIndex,
    required this.results,
  });

  factory AuthorsResult({
    required int count,
    required int totalCount,
    required int page,
    required int totalPages,
    int? lastItemIndex,
    required List<_i2.Author> results,
  }) = _AuthorsResultImpl;

  factory AuthorsResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthorsResult(
      count: jsonSerialization['count'] as int,
      totalCount: jsonSerialization['totalCount'] as int,
      page: jsonSerialization['page'] as int,
      totalPages: jsonSerialization['totalPages'] as int,
      lastItemIndex: jsonSerialization['lastItemIndex'] as int?,
      results: (jsonSerialization['results'] as List)
          .map((e) => _i2.Author.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  int count;

  int totalCount;

  int page;

  int totalPages;

  int? lastItemIndex;

  List<_i2.Author> results;

  AuthorsResult copyWith({
    int? count,
    int? totalCount,
    int? page,
    int? totalPages,
    int? lastItemIndex,
    List<_i2.Author>? results,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalCount': totalCount,
      'page': page,
      'totalPages': totalPages,
      if (lastItemIndex != null) 'lastItemIndex': lastItemIndex,
      'results': results.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthorsResultImpl extends AuthorsResult {
  _AuthorsResultImpl({
    required int count,
    required int totalCount,
    required int page,
    required int totalPages,
    int? lastItemIndex,
    required List<_i2.Author> results,
  }) : super._(
          count: count,
          totalCount: totalCount,
          page: page,
          totalPages: totalPages,
          lastItemIndex: lastItemIndex,
          results: results,
        );

  @override
  AuthorsResult copyWith({
    int? count,
    int? totalCount,
    int? page,
    int? totalPages,
    Object? lastItemIndex = _Undefined,
    List<_i2.Author>? results,
  }) {
    return AuthorsResult(
      count: count ?? this.count,
      totalCount: totalCount ?? this.totalCount,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      lastItemIndex: lastItemIndex is int? ? lastItemIndex : this.lastItemIndex,
      results: results ?? this.results.clone(),
    );
  }
}
