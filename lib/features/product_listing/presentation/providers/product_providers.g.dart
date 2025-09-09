// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productLocalDataSourceHash() =>
    r'757e6f337e0bd483183c52d3a83aacf259af9bd7';

/// See also [productLocalDataSource].
@ProviderFor(productLocalDataSource)
final productLocalDataSourceProvider =
    AutoDisposeProvider<ProductLocalDataSource>.internal(
      productLocalDataSource,
      name: r'productLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductLocalDataSourceRef =
    AutoDisposeProviderRef<ProductLocalDataSource>;
String _$productRepositoryHash() => r'1f1831a14d9f1976511b509aca3c6f3c2a589048';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepositoryImpl>.internal(
      productRepository,
      name: r'productRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepositoryImpl>;
String _$productListHash() => r'd835b230f5b3966b706e79e02e474c24fc289c96';

/// See also [productList].
@ProviderFor(productList)
final productListProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  productList,
  name: r'productListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductListRef = AutoDisposeFutureProviderRef<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
