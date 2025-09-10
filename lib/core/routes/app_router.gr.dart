// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:mini_ecommerce_ui/features/cart/presentation/pages/cart_page.dart'
    as _i1;
import 'package:mini_ecommerce_ui/features/onboarding/presentation/onboarding_page.dart'
    as _i4;
import 'package:mini_ecommerce_ui/features/product_listing/domain/entity/product_entity.dart'
    as _i10;
import 'package:mini_ecommerce_ui/features/product_listing/presentation/pages/dashboard_page.dart'
    as _i2;
import 'package:mini_ecommerce_ui/features/product_listing/presentation/pages/home_page.dart'
    as _i3;
import 'package:mini_ecommerce_ui/features/product_listing/presentation/pages/product_details_page.dart'
    as _i5;
import 'package:mini_ecommerce_ui/features/product_listing/presentation/pages/search_page.dart'
    as _i6;
import 'package:mini_ecommerce_ui/features/product_listing/presentation/pages/setting_page.dart'
    as _i7;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i8.PageRouteInfo<void> {
  const CartRoute({List<_i8.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i5.ProductDetailsPage]
class ProductDetailsRoute extends _i8.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i9.Key? key,
    required _i10.Product product,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i5.ProductDetailsPage(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i9.Key? key;

  final _i10.Product product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SearchPage();
    },
  );
}

/// generated route for
/// [_i7.SettingPage]
class SettingRoute extends _i8.PageRouteInfo<void> {
  const SettingRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingPage();
    },
  );
}
