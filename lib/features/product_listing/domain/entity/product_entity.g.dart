// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  imageAsset: json['image_asset'] as String,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'title': instance.title,
  'price': instance.price,
  'image_asset': instance.imageAsset,
};
