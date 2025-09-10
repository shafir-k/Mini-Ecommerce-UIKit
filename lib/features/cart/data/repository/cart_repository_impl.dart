import 'package:mini_ecommerce_ui/features/cart/data/data_source/cart_data_source.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartProduct>> getCartItems() {
    return localDataSource.getCartItems();
  }

  @override
  Future<void> addToCart(CartProduct product) {
    return localDataSource.addToCart(product);
  }

  @override
  Future<void> removeFromCart(CartProduct product) {
    return localDataSource.removeFromCart(product);
  }

  @override
  Future<void> updateCartItemCount(CartProduct product, int newCount) {
    return localDataSource.updateCartItemCount(product, newCount);
  }
}
