import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/assets.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/icons.dart';
import 'package:books/core/resources/routs_manager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodel/changeApp.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<changAppCubit,ChangeAppState>(
      builder: (context,state){
        return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s24,vertical: AppSize.s40),
        child: Row(
        children: [
          changAppCubit.get(context).isDark?Image.asset(
              AssetsData.lImage,
              width: AppSize.s75.w,
              height:AppSize.s18.h
          ): Text(
              'BOOKLY',
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s24,
            ),
          ),
          const Spacer(),
            InkWell(
              onTap: (){
                changAppCubit.get(context).changeAppMode();
              },
              child: Image(
                width: 50.w,
                 height: 40.h,
                 image:changAppCubit.get(context).isDark? const AssetImage(
                     AssetsData.darkImage,
                 ): const AssetImage(
                     AssetsData.lightImage,
                 ),
           ),
            ),
           IconButton(onPressed: (){
    Navigator.pushReplacementNamed(context, NameRout.searchRoute);
    },
    icon:  Icon(
    IconBroken.Search,
    color: changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary ,
    size: AppSize.s28.sp,
    )),
         ],
       ),
     );
     },);
  }
}