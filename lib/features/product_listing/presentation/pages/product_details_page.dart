import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'package:mini_ecommerce_ui/features/cart/presentation/providers/cart_providers.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/features/product_listing/presentation/providers/product_details_providers.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

@RoutePage()
class ProductDetailsPage extends ConsumerWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSize = ref.watch(selectedSizeProvider);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 13, 13, 14),
          ),
        ),
        centerTitle: true,
        actions: [Assets.icons.search.svg(), 16.horizontalSpace],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32).r,
              child: Image.asset(
                product.imageAsset,
                fit: BoxFit.cover,
                // height: 400.h,
                width: double.infinity,
              ),
            ),
            12.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    const Row(
                      children: [
                        CircleAvatar(radius: 12, backgroundColor: Colors.brown),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Color(0xFF5D5B71),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Color(0xFFC0D2EB),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Size',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                12.verticalSpace,
                Row(
                  children: [
                    _buildSizeChip(ref, 'S'),
                    _buildSizeChip(ref, 'M'),
                    _buildSizeChip(ref, 'L'),
                    _buildSizeChip(ref, 'XL'),
                    _buildSizeChip(ref, 'XXL'),
                  ],
                ),
                // Price and Add to Cart button
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addToCart(
                              CartProduct(
                                id: product.id.toString(),
                                product: product,
                                selectedSize: selectedSize,
                                count: 1,
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 122, 0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ).r,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30).r,
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildSizeChip(WidgetRef ref, String size) {
    final selectedSize = ref.watch(selectedSizeProvider);
    final isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () {
        ref.read(selectedSizeProvider.notifier).change(size);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(size),
          side: BorderSide.none,
          backgroundColor: isSelected ? Colors.black : Colors.white,
          labelStyle: TextStyle(
            color: isSelected
                ? Colors.white
                : const Color.fromARGB(255, 121, 119, 128),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}
