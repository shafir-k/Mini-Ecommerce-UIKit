import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce_ui/features/cart/data/data_source/cart_data_source.dart';
import 'package:mini_ecommerce_ui/features/cart/data/repository/cart_repository_impl.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/repository/cart_repository.dart';
import 'package:mini_ecommerce_ui/features/shared/components/snackbar_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

final cartLocalDataSourceProvider = Provider<CartLocalDataSource>((ref) {
  return CartLocalDataSource();
});

final cartRepositoryProvider = Provider<CartRepositoryImpl>((ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepositoryImpl(localDataSource: localDataSource);
});

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Future<List<CartProduct>> build() {
    return ref.watch(cartRepositoryProvider).getCartItems();
  }

  Future<void> addToCart(CartProduct product) async {
    await ref.read(cartRepositoryProvider).addToCart(product);
    SnackBarManager.showSuccessSnackBar(message: "Product Added to Cart");
    state = AsyncData(await ref.read(cartRepositoryProvider).getCartItems());
  }

  Future<void> removeFromCart(CartProduct product) async {
    await ref.read(cartRepositoryProvider).removeFromCart(product);
    state = AsyncData(await ref.read(cartRepositoryProvider).getCartItems());
  }

  Future<void> updateItemCount(CartProduct product, int newCount) async {
    await ref
        .read(cartRepositoryProvider)
        .updateCartItemCount(product, newCount);
    state = AsyncData(await ref.read(cartRepositoryProvider).getCartItems());
  }
}
