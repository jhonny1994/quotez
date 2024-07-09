/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:quotez_client/src/protocol/author/authors_result.dart' as _i3;
import 'package:quotez_client/src/protocol/author/author.dart' as _i4;
import 'package:quotez_client/src/protocol/quote/quotes_result.dart' as _i5;
import 'package:quotez_client/src/protocol/quote/quote.dart' as _i6;
import 'package:quotez_client/src/protocol/tag/tag.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointAuthor extends _i1.EndpointRef {
  EndpointAuthor(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'author';

  _i2.Future<_i3.AuthorsResult?> list({
    String? sortBy,
    String? order,
    int? limit,
    int? page,
    String? slug,
  }) =>
      caller.callServerEndpoint<_i3.AuthorsResult?>(
        'author',
        'list',
        {
          'sortBy': sortBy,
          'order': order,
          'limit': limit,
          'page': page,
          'slug': slug,
        },
      );

  _i2.Future<_i4.Author?> get(String id) =>
      caller.callServerEndpoint<_i4.Author?>(
        'author',
        'get',
        {'id': id},
      );

  _i2.Future<_i3.AuthorsResult?> search(String query) =>
      caller.callServerEndpoint<_i3.AuthorsResult?>(
        'author',
        'search',
        {'query': query},
      );
}

/// {@category Endpoint}
class EndpointQuote extends _i1.EndpointRef {
  EndpointQuote(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quote';

  _i2.Future<_i5.QuotesResult?> list({
    String? sortBy,
    String? order,
    int? limit,
    int? page,
    String? slug,
  }) =>
      caller.callServerEndpoint<_i5.QuotesResult?>(
        'quote',
        'list',
        {
          'sortBy': sortBy,
          'order': order,
          'limit': limit,
          'page': page,
          'slug': slug,
        },
      );

  _i2.Future<_i5.QuotesResult?> search(String query) =>
      caller.callServerEndpoint<_i5.QuotesResult?>(
        'quote',
        'search',
        {'query': query},
      );

  _i2.Future<_i6.Quote?> get(String id) =>
      caller.callServerEndpoint<_i6.Quote?>(
        'quote',
        'get',
        {'id': id},
      );

  _i2.Future<List<_i6.Quote>?> random({
    int? limit,
    List<String>? tags,
  }) =>
      caller.callServerEndpoint<List<_i6.Quote>?>(
        'quote',
        'random',
        {
          'limit': limit,
          'tags': tags,
        },
      );
}

/// {@category Endpoint}
class EndpointTag extends _i1.EndpointRef {
  EndpointTag(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tag';

  _i2.Future<List<_i7.Tag>?> list() =>
      caller.callServerEndpoint<List<_i7.Tag>?>(
        'tag',
        'list',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    author = EndpointAuthor(this);
    quote = EndpointQuote(this);
    tag = EndpointTag(this);
  }

  late final EndpointAuthor author;

  late final EndpointQuote quote;

  late final EndpointTag tag;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'author': author,
        'quote': quote,
        'tag': tag,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
