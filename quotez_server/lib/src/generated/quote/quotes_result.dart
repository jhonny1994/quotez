/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class QuotesResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  QuotesResult._({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    this.lastItemIndex,
    required this.results,
  });

  factory QuotesResult({
    required int count,
    required int totalCount,
    required int page,
    required int totalPages,
    int? lastItemIndex,
    required List<_i2.Quote> results,
  }) = _QuotesResultImpl;

  factory QuotesResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuotesResult(
      count: jsonSerialization['count'] as int,
      totalCount: jsonSerialization['totalCount'] as int,
      page: jsonSerialization['page'] as int,
      totalPages: jsonSerialization['totalPages'] as int,
      lastItemIndex: jsonSerialization['lastItemIndex'] as int?,
      results: (jsonSerialization['results'] as List)
          .map((e) => _i2.Quote.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  int count;

  int totalCount;

  int page;

  int totalPages;

  int? lastItemIndex;

  List<_i2.Quote> results;

  QuotesResult copyWith({
    int? count,
    int? totalCount,
    int? page,
    int? totalPages,
    int? lastItemIndex,
    List<_i2.Quote>? results,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'count': count,
      'totalCount': totalCount,
      'page': page,
      'totalPages': totalPages,
      if (lastItemIndex != null) 'lastItemIndex': lastItemIndex,
      'results': results.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuotesResultImpl extends QuotesResult {
  _QuotesResultImpl({
    required int count,
    required int totalCount,
    required int page,
    required int totalPages,
    int? lastItemIndex,
    required List<_i2.Quote> results,
  }) : super._(
          count: count,
          totalCount: totalCount,
          page: page,
          totalPages: totalPages,
          lastItemIndex: lastItemIndex,
          results: results,
        );

  @override
  QuotesResult copyWith({
    int? count,
    int? totalCount,
    int? page,
    int? totalPages,
    Object? lastItemIndex = _Undefined,
    List<_i2.Quote>? results,
  }) {
    return QuotesResult(
      count: count ?? this.count,
      totalCount: totalCount ?? this.totalCount,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      lastItemIndex: lastItemIndex is int? ? lastItemIndex : this.lastItemIndex,
      results: results ?? this.results.clone(),
    );
  }
}
