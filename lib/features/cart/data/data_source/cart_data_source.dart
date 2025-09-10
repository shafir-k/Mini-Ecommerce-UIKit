import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'dart:convert';

class CartLocalDataSource {
  static const String _cartKey = 'cart_items';

  Future<List<CartProduct>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartString = prefs.getString(_cartKey);
    if (cartString == null) return [];
    final List<dynamic> decoded = jsonDecode(cartString);
    return decoded.map((json) => CartProduct.fromJson(json)).toList();
  }

  Future<void> addToCart(CartProduct product) async {
    final prefs = await SharedPreferences.getInstance();
    final List<CartProduct> currentItems = await getCartItems();
    final existingItemIndex = currentItems.indexWhere(
      (item) =>
          item.id == product.id && item.selectedSize == product.selectedSize,
    );

    if (existingItemIndex != -1) {
      final updatedItems = List<CartProduct>.from(currentItems);
      updatedItems[existingItemIndex] = updatedItems[existingItemIndex]
          .copyWith(
            count: updatedItems[existingItemIndex].count + product.count,
          );
      await prefs.setString(_cartKey, jsonEncode(updatedItems));
    } else {
      final updatedItems = [...currentItems, product];
      await prefs.setString(_cartKey, jsonEncode(updatedItems));
    }
  }

  Future<void> removeFromCart(CartProduct product) async {
    final prefs = await SharedPreferences.getInstance();
    final List<CartProduct> currentItems = await getCartItems();
    final updatedItems = currentItems
        .where(
          (item) =>
              item.id != product.id ||
              item.selectedSize != product.selectedSize,
        )
        .toList();
    await prefs.setString(_cartKey, jsonEncode(updatedItems));
  }

  Future<void> updateCartItemCount(CartProduct product, int newCount) async {
    final prefs = await SharedPreferences.getInstance();
    final List<CartProduct> currentItems = await getCartItems();
    final index = currentItems.indexWhere(
      (item) =>
          item.id == product.id && item.selectedSize == product.selectedSize,
    );

    if (index != -1) {
      final updatedItems = List<CartProduct>.from(currentItems);
      if (newCount > 0) {
        updatedItems[index] = updatedItems[index].copyWith(count: newCount);
      } else {
        updatedItems.removeAt(index);
      }
      await prefs.setString(_cartKey, jsonEncode(updatedItems));
    }
  }
}
