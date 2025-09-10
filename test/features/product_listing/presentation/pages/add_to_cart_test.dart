
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_ecommerce_ui/core/routes/app_router.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'package:mini_ecommerce_ui/features/cart/presentation/providers/cart_providers.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/features/product_listing/presentation/providers/product_providers.dart';
import 'package:mini_ecommerce_ui/core/routes/app_router.gr.dart';

class FakeCartNotifier extends CartNotifier {
  CartProduct? lastAddedProduct;

  @override
  Future<void> addToCart(CartProduct product) async {
    lastAddedProduct = product;
    return;
  }
}

void main() {
  final fakeCartNotifier = FakeCartNotifier();

  final mockProducts = [
    Product(id: 1, title: 'Product 1', price: 10.0, imageAsset: 'assets/images/shirt1.png'),
    Product(id: 2, title: 'Product 2', price: 20.0, imageAsset: 'assets/images/shirt2.png'),
  ];

  testWidgets('Add to cart flow', (WidgetTester tester) async {
    final appRouter = AppRouter();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          productListProvider.overrideWith((_) => Future.value(mockProducts)),
          cartNotifierProvider.overrideWith(() => fakeCartNotifier),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            routerConfig: appRouter.config(
              deepLinkBuilder: (_) => DeepLink.single(
                DashboardRoute(),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Find the InkWell for the first product and tap on it.
    final productCardInkWell = find.ancestor(
      of: find.text('Product 1'),
      matching: find.byType(InkWell),
    );
    await tester.tap(productCardInkWell);
    await tester.pumpAndSettle();

    // We are now on the product details page.
    // Find the size 'M' and tap on it.
    await tester.tap(find.text('M'));
    await tester.pumpAndSettle();

    // Find the 'Add to Cart' button and tap on it.
    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    // Verify that addToCart was called with the correct product.
    expect(fakeCartNotifier.lastAddedProduct, isNotNull);
    expect(fakeCartNotifier.lastAddedProduct!.product.id, 1);
    expect(fakeCartNotifier.lastAddedProduct!.selectedSize, 'M');
  });
}
