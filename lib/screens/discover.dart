// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.06),
                    border: Border.all(color: Colors.grey, width: 0.w),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    children: [
                      IntrinsicWidth(
                        stepHeight: 40.h,
                        stepWidth: 100.w,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Pizza',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
