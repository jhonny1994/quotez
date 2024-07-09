/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Author implements _i1.SerializableModel {
  Author._({
    this.id,
    required this.name,
    required this.bio,
    required this.description,
    required this.link,
    required this.quoteCount,
    required this.slug,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Author({
    String? id,
    required String name,
    required String bio,
    required String description,
    required String link,
    required int quoteCount,
    required String slug,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) = _AuthorImpl;

  factory Author.fromJson(Map<String, dynamic> jsonSerialization) {
    return Author(
      id: jsonSerialization['id'] as String?,
      name: jsonSerialization['name'] as String,
      bio: jsonSerialization['bio'] as String,
      description: jsonSerialization['description'] as String,
      link: jsonSerialization['link'] as String,
      quoteCount: jsonSerialization['quoteCount'] as int,
      slug: jsonSerialization['slug'] as String,
      dateAdded:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateAdded']),
      dateModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateModified']),
    );
  }

  String? id;

  String name;

  String bio;

  String description;

  String link;

  int quoteCount;

  String slug;

  DateTime dateAdded;

  DateTime dateModified;

  Author copyWith({
    String? id,
    String? name,
    String? bio,
    String? description,
    String? link,
    int? quoteCount,
    String? slug,
    DateTime? dateAdded,
    DateTime? dateModified,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'bio': bio,
      'description': description,
      'link': link,
      'quoteCount': quoteCount,
      'slug': slug,
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

class _AuthorImpl extends Author {
  _AuthorImpl({
    String? id,
    required String name,
    required String bio,
    required String description,
    required String link,
    required int quoteCount,
    required String slug,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) : super._(
          id: id,
          name: name,
          bio: bio,
          description: description,
          link: link,
          quoteCount: quoteCount,
          slug: slug,
          dateAdded: dateAdded,
          dateModified: dateModified,
        );

  @override
  Author copyWith({
    Object? id = _Undefined,
    String? name,
    String? bio,
    String? description,
    String? link,
    int? quoteCount,
    String? slug,
    DateTime? dateAdded,
    DateTime? dateModified,
  }) {
    return Author(
      id: id is String? ? id : this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      description: description ?? this.description,
      link: link ?? this.link,
      quoteCount: quoteCount ?? this.quoteCount,
      slug: slug ?? this.slug,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}