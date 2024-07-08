/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Quote
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Quote._({
    this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Quote({
    String? id,
    required String content,
    required String author,
    required List<String> tags,
    required String authorSlug,
    required int length,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) = _QuoteImpl;

  factory Quote.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quote(
      id: jsonSerialization['id'] as String?,
      content: jsonSerialization['content'] as String,
      author: jsonSerialization['author'] as String,
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
      authorSlug: jsonSerialization['authorSlug'] as String,
      length: jsonSerialization['length'] as int,
      dateAdded:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateAdded']),
      dateModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateModified']),
    );
  }

  String? id;

  String content;

  String author;

  List<String> tags;

  String authorSlug;

  int length;

  DateTime dateAdded;

  DateTime dateModified;

  Quote copyWith({
    String? id,
    String? content,
    String? author,
    List<String>? tags,
    String? authorSlug,
    int? length,
    DateTime? dateAdded,
    DateTime? dateModified,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'author': author,
      'tags': tags.toJson(),
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded.toJson(),
      'dateModified': dateModified.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'author': author,
      'tags': tags.toJson(),
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded.toJson(),
      'dateModified': dateModified.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuoteImpl extends Quote {
  _QuoteImpl({
    String? id,
    required String content,
    required String author,
    required List<String> tags,
    required String authorSlug,
    required int length,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) : super._(
          id: id,
          content: content,
          author: author,
          tags: tags,
          authorSlug: authorSlug,
          length: length,
          dateAdded: dateAdded,
          dateModified: dateModified,
        );

  @override
  Quote copyWith({
    Object? id = _Undefined,
    String? content,
    String? author,
    List<String>? tags,
    String? authorSlug,
    int? length,
    DateTime? dateAdded,
    DateTime? dateModified,
  }) {
    return Quote(
      id: id is String? ? id : this.id,
      content: content ?? this.content,
      author: author ?? this.author,
      tags: tags ?? this.tags.clone(),
      authorSlug: authorSlug ?? this.authorSlug,
      length: length ?? this.length,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
