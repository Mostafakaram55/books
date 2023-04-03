
import 'package:books/core/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerSimilerItem extends StatelessWidget {
  const ShimmerSimilerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemBuilder:(context,index)=> Padding(
          padding:  EdgeInsets.all(8.0.sp),
          child: ShimmerContainerEffect(
            borderRadius: 8.sp,
            width: 70.w,
            height: 115.h,
          ),
        ),
      itemCount: 10,
    );
  }
}
