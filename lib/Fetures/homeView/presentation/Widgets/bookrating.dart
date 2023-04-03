import 'package:books/Fetures/homeView/data/Models/booksModel.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/stylemanager.dart';
import '../../../../core/resources/textmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Models/book_model.dart';
class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.count}) : super(key: key);
  final num rating ;
  final num count ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<changAppCubit,ChangeAppState>(
      builder: (context,state){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width: AppSize.s13.w,
              height: AppSize.s12.h,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s14),
                image:  const DecorationImage(
                  image:AssetImage(AssetsData.starImage),
                ),
              ),
            ),
            SizedBox(
              width: 6.3.w,
            ),
            Text(
              rating.toString(),
              style:getMediumStyle(
                  color: changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                  fontSize: AppSize.s16.sp
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '($count)',
              style: getRegularStyle(
                  color: changAppCubit.get(context).isDark?ColorManager.gray:ColorManager.primary,
                  fontSize: AppSize.s14.sp
              ),
            ),
          ],
        );
      },
    );
  }
}