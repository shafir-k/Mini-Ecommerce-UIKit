import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 18.sp,
            color: Color.fromARGB(255, 13, 13, 14),
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
            Spacer(),
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
                Row(
                  children: [
                    _buildSizeChip('S', false),
                    _buildSizeChip('M', false),
                    _buildSizeChip('L', true),
                    _buildSizeChip('XL', false),
                    _buildSizeChip('XXL', false),
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
                        // Handle add to cart logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 122, 0),
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

  Widget _buildSizeChip(String size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          size,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Color.fromARGB(255, 121, 119, 128),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
