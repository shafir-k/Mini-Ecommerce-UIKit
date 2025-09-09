import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

class ProductLocalDataSource {
  Future<List<Product>> getProducts() async {
    final String response = await rootBundle.loadString(Assets.json.products);
    final List<dynamic> data = await json.decode(response);
    return data.map((item) => Product.fromJson(item)).toList();
  }
}
