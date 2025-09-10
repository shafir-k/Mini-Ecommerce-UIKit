import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_ui/core/routes/app_router.gr.dart';
import 'package:mini_ecommerce_ui/features/cart/domain/entity/cart_product.dart';
import 'package:mini_ecommerce_ui/features/cart/presentation/providers/cart_providers.dart';
import 'package:mini_ecommerce_ui/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

@RoutePage()
class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 13, 13, 14),
          ),
        ),
        centerTitle: true,
      ),
      body: cartState.when(
        data: (cartItems) {
          double totalItemsPrice = cartItems.fold(
            0,
            (sum, item) => sum + (item.product.price * item.count),
          );
          return cartItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.bag.svg(),
                      16.verticalSpace,
                      Text("Cart is empty"),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Dismissible(
                            key: Key(item.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .removeFromCart(item);
                            },
                            background: Container(
                              margin: EdgeInsets.only(bottom: 64.h),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 122, 0),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20.0),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: CartItemWidget(cartProduct: item),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Items (3)'),
                              Text('\$${totalItemsPrice.toStringAsFixed(2)}'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Standard Delivery'),
                              Text('\$12.00'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Payment'),
                              Text(
                                '\$${(totalItemsPrice + 12).toStringAsFixed(2)}',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.router.push(CheckoutRoute());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 122, 0),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Text(
                              'Checkout Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
