import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';

abstract class CartRepository {
  Future<List<CartProduct>> getCartItems();
  Future<void> addToCart(CartProduct product);
  Future<void> removeFromCart(CartProduct product);
  Future<void> updateCartItemCount(CartProduct product, int newCount);
}
