import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Color.fromARGB(255, 255, 122, 0),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Assets.icons.home.svg(),
                activeIcon: Assets.icons.home.svg(
                  color: Color.fromARGB(255, 255, 122, 0),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.search.svg(),
                activeIcon: Assets.icons.search.svg(
                  color: Color.fromARGB(255, 255, 122, 0),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.bag.svg(),
                activeIcon: Assets.icons.bag.svg(
                  color: Color.fromARGB(255, 255, 122, 0),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.settings.svg(),
                activeIcon: Assets.icons.settings.svg(
                  color: Color.fromARGB(255, 255, 122, 0),
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
