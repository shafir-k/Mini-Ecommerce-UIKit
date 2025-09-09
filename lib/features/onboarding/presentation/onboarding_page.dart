import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ecommerce_ui/core/routes/app_router.gr.dart';
import 'package:mini_ecommerce_ui/features/product_listing/presentation/pages/dashboard_page.dart';
import 'package:mini_ecommerce_ui/gen/assets.gen.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ).r,
                child: Assets.images.onboarding.image(
                  height: ScreenUtil().screenHeight * 0.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find The\nBest Collections',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 42.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  6.verticalSpace,
                  // Description text
                  Text(
                    'Get your dream item ready with fashionhub\nand get other interesting offer',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 121, 119, 128),
                    ),
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      // Sign Up button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement navigation to the sign up screen here
                            // For example: context.router.push(const SignUpRoute());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16).r,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30).r,
                              side: const BorderSide(color: Colors.black),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      16.horizontalSpace,
                      // Sign In button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.router.replaceAll([DashboardRoute()]);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA500),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16).r,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30).r,
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
