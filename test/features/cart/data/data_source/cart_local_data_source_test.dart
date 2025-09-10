import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_ecommerce_ui/features/cart/data/data_source/cart_data_source.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'dart:convert';

void main() {
  group('CartLocalDataSource', () {
    late CartLocalDataSource dataSource;
    late SharedPreferences sharedPreferences;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sharedPreferences = await SharedPreferences.getInstance();
      dataSource = CartLocalDataSource();
    });

    final product1 = Product(
      id: 1,
      title: 'Product 1',
      price: 10.0,
      imageAsset: 'image1.png',
    );

    final cartProduct1 = CartProduct(
      id: '1',
      product: product1,
      selectedSize: 'M',
      count: 1,
    );

    final product2 = Product(
      id: 2,
      title: 'Product 2',
      price: 20.0,
      imageAsset: 'image2.png',
    );

    final cartProduct2 = CartProduct(
      id: '2',
      product: product2,
      selectedSize: 'L',
      count: 2,
    );

    test('getCartItems returns empty list when no items are in cart', () async {
      final result = await dataSource.getCartItems();
      expect(result, []);
    });

    test('getCartItems returns list of cart products when items are in cart', () async {
      final cartItems = [cartProduct1, cartProduct2];
      await sharedPreferences.setString('cart_items', jsonEncode(cartItems.map((e) => e.toJson()).toList()));

      final result = await dataSource.getCartItems();
      expect(result, cartItems);
    });

    test('addToCart adds a new product to the cart', () async {
      await dataSource.addToCart(cartProduct1);
      final result = await dataSource.getCartItems();
      expect(result, [cartProduct1]);
    });

    test('addToCart increases the count of an existing product in the cart', () async {
      await dataSource.addToCart(cartProduct1);
      await dataSource.addToCart(cartProduct1.copyWith(count: 2));

      final result = await dataSource.getCartItems();
      expect(result.length, 1);
      expect(result.first.count, 3);
    });

    test('removeFromCart removes a product from the cart', () async {
      await dataSource.addToCart(cartProduct1);
      await dataSource.addToCart(cartProduct2);

      await dataSource.removeFromCart(cartProduct1);
      final result = await dataSource.getCartItems();
      expect(result, [cartProduct2]);
    });

    test('updateCartItemCount updates the count of a product in the cart', () async {
      await dataSource.addToCart(cartProduct1);
      await dataSource.updateCartItemCount(cartProduct1, 5);

      final result = await dataSource.getCartItems();
      expect(result.first.count, 5);
    });

    test('updateCartItemCount removes the product if count is zero', () async {
      await dataSource.addToCart(cartProduct1);
      await dataSource.updateCartItemCount(cartProduct1, 0);

      final result = await dataSource.getCartItems();
      expect(result, []);
    });

    test('updateCartItemCount removes the product if count is less than zero', () async {
      await dataSource.addToCart(cartProduct1);
      await dataSource.updateCartItemCount(cartProduct1, -1);

      final result = await dataSource.getCartItems();
      expect(result, []);
    });
  });
}
