
import 'package:books/core/resources/assets.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDetailsImageItem extends StatelessWidget {
  const CustomDetailsImageItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s14),
        image: const  DecorationImage(
            image: AssetImage(AssetsData.imageDetails),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}