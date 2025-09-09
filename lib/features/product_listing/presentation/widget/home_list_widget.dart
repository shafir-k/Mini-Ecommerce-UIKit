import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mini_ecommerce_ui/core/routes/app_router.gr.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key, required this.productList});
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: kToolbarHeight,
          floating: true,
          snap: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 48.w,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0).r,
            child: IconButton(onPressed: () {}, icon: Assets.icons.menu.svg()),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Assets.icons.profile.svg()),
            8.horizontalSpace,
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Best trendy collection!',
                  style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                ),
                8.verticalSpace,
                // Category buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('All', true),
                      _buildCategoryChip('Men', false),
                      _buildCategoryChip('Women', false),
                      _buildCategoryChip('Kids', false),
                      _buildCategoryChip('Other', false),
                    ],
                  ),
                ),
                8.verticalSpace,
              ],
            ),
          ),
        ),
        // Products grid using SliverMasonryGrid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 14.w,
            crossAxisSpacing: 16.w,
            childCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return InkWell(
                onTap: () {
                  context.router.push(ProductDetailsRoute(product: product));
                },
                child: _buildProductCard(
                  product.title,
                  product.price,
                  product.imageAsset,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Chip(
      side: BorderSide.none,
      label: Text(label),
      backgroundColor: isSelected ? Colors.deepOrange : Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30).r,
        side: BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4).r,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildProductCard(String title, double price, String imageAsset) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for the product image
          Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  24.verticalSpace,
                ],
              ),
              Positioned(
                bottom: 0,
                right: 16,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  icon: Container(
                    padding: EdgeInsets.all(8).r,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Assets.icons.bag.svg(
                      fit: BoxFit.cover,
                      height: 16.h,
                      width: 16.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color.fromARGB(255, 121, 119, 128),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
