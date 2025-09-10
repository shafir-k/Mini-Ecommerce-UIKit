import 'package:flutter/material.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';

class CartItemWidget extends StatelessWidget {
  final CartProduct cartProduct;

  const CartItemWidget({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        cartProduct.product.imageAsset,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(cartProduct.product.title),
      subtitle: Text('Size ${cartProduct.selectedSize}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('\$${cartProduct.product.price.toStringAsFixed(2)}'),
          const SizedBox(width: 8),
          Text('${cartProduct.count}x'),
        ],
      ),
    );
  }
}
