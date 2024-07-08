/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/author_endpoint.dart' as _i2;
import '../endpoints/quote_endpoint.dart' as _i3;
import '../endpoints/tag_endpoint.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'author': _i2.AuthorEndpoint()
        ..initialize(
          server,
          'author',
          null,
        ),
      'quote': _i3.QuoteEndpoint()
        ..initialize(
          server,
          'quote',
          null,
        ),
      'tag': _i4.TagEndpoint()
        ..initialize(
          server,
          'tag',
          null,
        ),
    };
    connectors['author'] = _i1.EndpointConnector(
      name: 'author',
      endpoint: endpoints['author']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'order': _i1.ParameterDescription(
              name: 'order',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'slug': _i1.ParameterDescription(
              name: 'slug',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['author'] as _i2.AuthorEndpoint).list(
            session,
            sortBy: params['sortBy'],
            order: params['order'],
            limit: params['limit'],
            page: params['page'],
            slug: params['slug'],
          ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['author'] as _i2.AuthorEndpoint).get(
            session,
            params['id'],
          ),
        ),
        'search': _i1.MethodConnector(
          name: 'search',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['author'] as _i2.AuthorEndpoint).search(
            session,
            params['query'],
          ),
        ),
      },
    );
    connectors['quote'] = _i1.EndpointConnector(
      name: 'quote',
      endpoint: endpoints['quote']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'order': _i1.ParameterDescription(
              name: 'order',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'slug': _i1.ParameterDescription(
              name: 'slug',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).list(
            session,
            sortBy: params['sortBy'],
            order: params['order'],
            limit: params['limit'],
            page: params['page'],
            slug: params['slug'],
          ),
        ),
        'search': _i1.MethodConnector(
          name: 'search',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).search(
            session,
            params['query'],
          ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).get(
            session,
            params['id'],
          ),
        ),
        'random': _i1.MethodConnector(
          name: 'random',
          params: {
            'tags': _i1.ParameterDescription(
              name: 'tags',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quote'] as _i3.QuoteEndpoint).random(
            session,
            params['tags'],
            params['limit'],
          ),
        ),
      },
    );
    connectors['tag'] = _i1.EndpointConnector(
      name: 'tag',
      endpoint: endpoints['tag']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i4.TagEndpoint).list(session),
        )
      },
    );
  }
}
