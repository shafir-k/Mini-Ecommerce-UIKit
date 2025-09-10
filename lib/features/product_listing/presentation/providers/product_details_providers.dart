import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_providers.g.dart';

@riverpod
class SelectedSize extends _$SelectedSize {
  @override
  String build() {
    return "L";
  }

  void change(String size) {
    state = size;
  }
}
