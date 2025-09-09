import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/features/product_listing/presentation/providers/product_providers.dart';
import 'package:mini_ecommerce_ui/features/product_listing/presentation/widget/home_list_skeleton_widget.dart';
import 'package:mini_ecommerce_ui/features/product_listing/presentation/widget/home_list_widget.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListProvider);
    // Sample product data to populate the grid

    return Scaffold(
      body: SafeArea(
        child: productListState.when(
          data: (productList) => HomeListWidget(productList: productList),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => Skeletonizer(child: HomeListSkeletonWidget()),
        ),
      ),
    );
  }
}
