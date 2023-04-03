
import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/routs_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(vertical: AppSize.s30,horizontal: AppSize.s30),
      child: Row(
        children: [
          BlocBuilder<changAppCubit,ChangeAppState>(
            builder: (context,state){
              return IconButton(onPressed:(){
                Navigator.pushReplacementNamed(context, NameRout.homeRoute);
              }, icon:  Icon(
                Icons.close_rounded,
                color: changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                size: AppSize.s28.sp,
              ));
            },
          ),
        ],
      ),
    );
  }
}