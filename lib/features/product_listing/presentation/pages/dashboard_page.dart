import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce_ui/core/routes/app_router.gr.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

// Assuming you have defined the following routes in your app_router.dart:
// - HomeRoute
// - SearchRoute
// - CartRoute
// - SettingsRoute

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // The children list defines the routes for each tab.
      // The order here must match the order of the BottomNavigationBarItems.
      routes: const [
        // Replace these with your actual route definitions.
        const HomeRoute(),
        const SearchRoute(),
        const CartRoute(),
        const SettingRoute(),
      ],
      builder: (context, child) {
        // The tabsRouter is used to control the state of the tabs.
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          // The child widget from the builder is the currently active route.
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Assets.icons.home.image(),
                activeIcon: Assets.icons.home.image(color: Colors.orange),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.search.image(),
                activeIcon: Assets.icons.search.image(color: Colors.orange),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.cart.image(),
                activeIcon: Assets.icons.cart.image(color: Colors.orange),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.settings.image(),
                activeIcon: Assets.icons.settings.image(color: Colors.orange),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
