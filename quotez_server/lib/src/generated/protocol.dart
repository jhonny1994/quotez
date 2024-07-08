/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'author/author.dart' as _i3;
import 'author/authors_result.dart' as _i4;
import 'quote/quote.dart' as _i5;
import 'quote/quotes_result.dart' as _i6;
import 'tag/tag.dart' as _i7;
import 'protocol.dart' as _i8;
import 'package:quotez_server/src/generated/quote/quote.dart' as _i9;
import 'package:quotez_server/src/generated/tag/tag.dart' as _i10;
export 'author/author.dart';
export 'author/authors_result.dart';
export 'quote/quote.dart';
export 'quote/quotes_result.dart';
export 'tag/tag.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Author) {
      return _i3.Author.fromJson(data) as T;
    }
    if (t == _i4.AuthorsResult) {
      return _i4.AuthorsResult.fromJson(data) as T;
    }
    if (t == _i5.Quote) {
      return _i5.Quote.fromJson(data) as T;
    }
    if (t == _i6.QuotesResult) {
      return _i6.QuotesResult.fromJson(data) as T;
    }
    if (t == _i7.Tag) {
      return _i7.Tag.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Author?>()) {
      return (data != null ? _i3.Author.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AuthorsResult?>()) {
      return (data != null ? _i4.AuthorsResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Quote?>()) {
      return (data != null ? _i5.Quote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.QuotesResult?>()) {
      return (data != null ? _i6.QuotesResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Tag?>()) {
      return (data != null ? _i7.Tag.fromJson(data) : null) as T;
    }
    if (t == List<_i8.Author>) {
      return (data as List).map((e) => deserialize<_i8.Author>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.Quote>) {
      return (data as List).map((e) => deserialize<_i8.Quote>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i9.Quote>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i9.Quote>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.Tag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.Tag>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Author) {
      return 'Author';
    }
    if (data is _i4.AuthorsResult) {
      return 'AuthorsResult';
    }
    if (data is _i5.Quote) {
      return 'Quote';
    }
    if (data is _i6.QuotesResult) {
      return 'QuotesResult';
    }
    if (data is _i7.Tag) {
      return 'Tag';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Author') {
      return deserialize<_i3.Author>(data['data']);
    }
    if (data['className'] == 'AuthorsResult') {
      return deserialize<_i4.AuthorsResult>(data['data']);
    }
    if (data['className'] == 'Quote') {
      return deserialize<_i5.Quote>(data['data']);
    }
    if (data['className'] == 'QuotesResult') {
      return deserialize<_i6.QuotesResult>(data['data']);
    }
    if (data['className'] == 'Tag') {
      return deserialize<_i7.Tag>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'quotez';
}
