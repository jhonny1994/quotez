// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_quote_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomQuoteHash() => r'6adc1e7cf003d949ea359b18bd1d03624d0a0bc4';

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

/// See also [randomQuote].
@ProviderFor(randomQuote)
const randomQuoteProvider = RandomQuoteFamily();

/// See also [randomQuote].
class RandomQuoteFamily extends Family<AsyncValue<Either<String, Quote>>> {
  /// See also [randomQuote].
  const RandomQuoteFamily();

  /// See also [randomQuote].
  RandomQuoteProvider call({
    String? tag,
  }) {
    return RandomQuoteProvider(
      tag: tag,
    );
  }

  @override
  RandomQuoteProvider getProviderOverride(
    covariant RandomQuoteProvider provider,
  ) {
    return call(
      tag: provider.tag,
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
  String? get name => r'randomQuoteProvider';
}

/// See also [randomQuote].
class RandomQuoteProvider
    extends AutoDisposeFutureProvider<Either<String, Quote>> {
  /// See also [randomQuote].
  RandomQuoteProvider({
    String? tag,
  }) : this._internal(
          (ref) => randomQuote(
            ref as RandomQuoteRef,
            tag: tag,
          ),
          from: randomQuoteProvider,
          name: r'randomQuoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomQuoteHash,
          dependencies: RandomQuoteFamily._dependencies,
          allTransitiveDependencies:
              RandomQuoteFamily._allTransitiveDependencies,
          tag: tag,
        );

  RandomQuoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tag,
  }) : super.internal();

  final String? tag;

  @override
  Override overrideWith(
    FutureOr<Either<String, Quote>> Function(RandomQuoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomQuoteProvider._internal(
        (ref) => create(ref as RandomQuoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tag: tag,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<String, Quote>> createElement() {
    return _RandomQuoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomQuoteProvider && other.tag == tag;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomQuoteRef on AutoDisposeFutureProviderRef<Either<String, Quote>> {
  /// The parameter `tag` of this provider.
  String? get tag;
}

class _RandomQuoteProviderElement
    extends AutoDisposeFutureProviderElement<Either<String, Quote>>
    with RandomQuoteRef {
  _RandomQuoteProviderElement(super.provider);

  @override
  String? get tag => (origin as RandomQuoteProvider).tag;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
