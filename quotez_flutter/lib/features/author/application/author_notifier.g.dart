// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authorListHash() => r'50a983149a2cbef76840188d290b7a4c78d03e8c';

/// See also [authorList].
@ProviderFor(authorList)
final authorListProvider =
    AutoDisposeFutureProvider<Either<String, AuthorsResult>>.internal(
  authorList,
  name: r'authorListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthorListRef
    = AutoDisposeFutureProviderRef<Either<String, AuthorsResult>>;
String _$authorDetailsHash() => r'dc22f17b52ef02e0621ce8bfcfa4e6001cf5beb9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [authorDetails].
@ProviderFor(authorDetails)
const authorDetailsProvider = AuthorDetailsFamily();

/// See also [authorDetails].
class AuthorDetailsFamily extends Family<AsyncValue<Either<String, Author>>> {
  /// See also [authorDetails].
  const AuthorDetailsFamily();

  /// See also [authorDetails].
  AuthorDetailsProvider call(
    String id,
  ) {
    return AuthorDetailsProvider(
      id,
    );
  }

  @override
  AuthorDetailsProvider getProviderOverride(
    covariant AuthorDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'authorDetailsProvider';
}

/// See also [authorDetails].
class AuthorDetailsProvider
    extends AutoDisposeFutureProvider<Either<String, Author>> {
  /// See also [authorDetails].
  AuthorDetailsProvider(
    String id,
  ) : this._internal(
          (ref) => authorDetails(
            ref as AuthorDetailsRef,
            id,
          ),
          from: authorDetailsProvider,
          name: r'authorDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authorDetailsHash,
          dependencies: AuthorDetailsFamily._dependencies,
          allTransitiveDependencies:
              AuthorDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  AuthorDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Either<String, Author>> Function(AuthorDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuthorDetailsProvider._internal(
        (ref) => create(ref as AuthorDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<String, Author>> createElement() {
    return _AuthorDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthorDetailsRef on AutoDisposeFutureProviderRef<Either<String, Author>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AuthorDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Either<String, Author>>
    with AuthorDetailsRef {
  _AuthorDetailsProviderElement(super.provider);

  @override
  String get id => (origin as AuthorDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
