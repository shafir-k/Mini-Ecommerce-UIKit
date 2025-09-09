import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
