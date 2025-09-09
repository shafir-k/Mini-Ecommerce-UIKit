import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String title,
    required double price,
    @JsonKey(name: "image_asset") required String imageAsset,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
