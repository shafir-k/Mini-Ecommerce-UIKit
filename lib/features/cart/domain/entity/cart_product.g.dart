// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProduct _$CartProductFromJson(Map<String, dynamic> json) => _CartProduct(
  id: json['id'] as String,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  selectedSize: json['selectedSize'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$CartProductToJson(_CartProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'selectedSize': instance.selectedSize,
      'count': instance.count,
    };
