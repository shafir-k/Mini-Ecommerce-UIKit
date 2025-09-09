import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product data to populate the grid
    final List<Map<String, dynamic>> products = [
      {
        'title': 'Tagerine Shirt',
        'price': 240.32,
        'image_asset': Assets.images.shirt1.path,
      },
      {
        'title': 'Leather Coat',
        'price': 325.36,
        'image_asset': Assets.images.shirt2.path,
      },
      {
        'title': 'Tagerine Shirt',
        'price': 126.47,
        'image_asset': Assets.images.shirt3.path,
      },
      {
        'title': 'Leather Coat',
        'price': 257.85,
        'image_asset': Assets.images.shirt4.path,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Header section with icon and title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.grid_view_rounded, size: 30),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 30), // Placeholder to balance the row
                ],
              ),
              const SizedBox(height: 24),
              // Explore text
              const Text(
                'Explore',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Best trendy collection',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              // Category buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Men', true),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Women', false),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Kids', false),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Other', false),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Products grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _buildProductCard(
                    product['title']!,
                    product['price']!,
                    product['image_asset']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Chip(
      label: Text(label),
      backgroundColor: isSelected ? Colors.black : Colors.grey[200],
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildProductCard(String title, double price, String imageAsset) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for the product image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(imageAsset, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Leather Coat', // Placeholder for a sub-title as per design
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
