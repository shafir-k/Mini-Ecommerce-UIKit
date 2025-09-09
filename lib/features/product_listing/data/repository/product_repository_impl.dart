import 'package:mini_ecommerce_ui/features/product_listing/data/data_source/product_data_source.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Product>> getProducts() async {
    //mocks api calls
    await Future.delayed(Duration(seconds: 2));
    return localDataSource.getProducts();
  }
}
