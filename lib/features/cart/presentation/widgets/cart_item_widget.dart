import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';

class CartItemWidget extends StatelessWidget {
  final CartProduct cartProduct;

  const CartItemWidget({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12).r,
            child: Image.asset(
              cartProduct.product.imageAsset,
              width: 75.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(cartProduct.product.title),
              Text('Size ${cartProduct.selectedSize}'),
              32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('\$${cartProduct.product.price.toStringAsFixed(2)}'),
                  const SizedBox(width: 8),
                  Text('${cartProduct.count}x'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
