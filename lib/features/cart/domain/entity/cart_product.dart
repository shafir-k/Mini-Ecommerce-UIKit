import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
abstract class CartProduct with _$CartProduct {
  const factory CartProduct({
    required String id,
    required Product product,
    required String selectedSize,
    required int count,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
