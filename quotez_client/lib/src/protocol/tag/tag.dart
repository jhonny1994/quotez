/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Tag implements _i1.SerializableModel {
  Tag._({
    this.id,
    required this.name,
    required this.slug,
    required this.quoteCount,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Tag({
    String? id,
    required String name,
    required String slug,
    required int quoteCount,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
      id: jsonSerialization['id'] as String?,
      name: jsonSerialization['name'] as String,
      slug: jsonSerialization['slug'] as String,
      quoteCount: jsonSerialization['quoteCount'] as int,
      dateAdded:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateAdded']),
      dateModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateModified']),
    );
  }

  String? id;

  String name;

  String slug;

  int quoteCount;

  DateTime dateAdded;

  DateTime dateModified;

  Tag copyWith({
    String? id,
    String? name,
    String? slug,
    int? quoteCount,
    DateTime? dateAdded,
    DateTime? dateModified,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'slug': slug,
      'quoteCount': quoteCount,
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

class _TagImpl extends Tag {
  _TagImpl({
    String? id,
    required String name,
    required String slug,
    required int quoteCount,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) : super._(
          id: id,
          name: name,
          slug: slug,
          quoteCount: quoteCount,
          dateAdded: dateAdded,
          dateModified: dateModified,
        );

  @override
  Tag copyWith({
    Object? id = _Undefined,
    String? name,
    String? slug,
    int? quoteCount,
    DateTime? dateAdded,
    DateTime? dateModified,
  }) {
    return Tag(
      id: id is String? ? id : this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      quoteCount: quoteCount ?? this.quoteCount,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
