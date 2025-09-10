import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce_ui/features/cart/presentation/providers/cart_providers.dart';

@RoutePage()
class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartNotifierProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 13, 13, 14),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: cartAsync.when(
          data: (cartProducts) {
            final totalItems = cartProducts.fold<int>(
              0,
              (sum, item) => sum + item.count,
            );
            final totalPrice = cartProducts.fold<double>(
              0,
              (sum, item) => sum + item.product.price * item.count,
            );
            const deliveryFee = 12.0;
            final totalPayment = totalPrice + deliveryFee;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Delivery Address
                const Text(
                  'Delivery Address',
                  style: TextStyle(
                    color: Color(0xFFB1B1B1),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://maps.gstatic.com/tactile/pane/default_geocode-2x.png',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '25/3 Housing Estate,\nSylhet',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Color(0xFFFF7A00),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 18,
                      color: Color(0xFFB1B1B1),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Delivered in next 7 days',
                      style: TextStyle(color: Color(0xFFB1B1B1), fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Payment Method
                const Text(
                  'Payment Method',
                  style: TextStyle(
                    color: Color(0xFFB1B1B1),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png',
                      width: 38,
                      height: 22,
                    ),
                    const SizedBox(width: 10),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png',
                      width: 38,
                      height: 22,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg',
                      width: 38,
                      height: 22,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
                      width: 28,
                      height: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Add Voucher
                ElevatedButton(
                  onPressed: null,
                  child: Center(
                    child: Text(
                      'Add Voucher',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Note
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Note: ',
                        style: TextStyle(
                          color: Color(0xFFFF7A00),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const TextSpan(
                        text: 'Use your order id at the payment. Your Id ',
                        style: TextStyle(
                          color: Color(0xFFB1B1B1),
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: '#154619',
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const TextSpan(
                        text:
                            ' If you forget to put your order id we can\'t confirm the payment.',
                        style: TextStyle(
                          color: Color(0xFFB1B1B1),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Payment Summary
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Items ($totalItems)',
                      style: const TextStyle(
                        color: Color(0xFFB1B1B1),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Standard Delivery',
                      style: TextStyle(color: Color(0xFFB1B1B1), fontSize: 15),
                    ),
                    Text(
                      '\$${deliveryFee.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Payment',
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$${totalPayment.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Pay Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7A00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: cartProducts.isEmpty ? null : () {},
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
