import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 13, 13, 14),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
