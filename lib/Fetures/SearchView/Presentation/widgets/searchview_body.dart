
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/routs_manager.dart';
import 'custom_search_list_view_item.dart';
import 'custom_textfiled.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                IconButton(onPressed:(){
                  Navigator.pushReplacementNamed(context, NameRout.homeRoute);
                }, icon:  Icon(
                  Icons.close_rounded,
                  color: ColorManager.white,
                  size: AppSize.s28.sp,
                )),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                const CustomSearchFormFiled(),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                const CustomSearchListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

