import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mini_ecommerce_ui/features/product_listing/data/data_source/product_data_source.dart';
import 'package:mini_ecommerce_ui/features/product_listing/data/repository/product_repository_impl.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  return ProductLocalDataSource();
}

@riverpod
ProductRepositoryImpl productRepository(Ref ref) {
  return ProductRepositoryImpl(
    localDataSource: ref.watch(productLocalDataSourceProvider),
  );
}

@riverpod
Future<List<Product>> productList(Ref ref) {
  return ref.watch(productRepositoryProvider).getProducts();
}
