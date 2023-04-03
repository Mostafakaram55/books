import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/font_manager.dart';
import 'package:books/core/resources/stylemanager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(

    //main color

    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.gray1,
    splashColor: ColorManager.lightPrimary,//ripple effect color

    //CardView theme

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4,
    ),


    // App BarTheme

    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      centerTitle: true,
      shadowColor: ColorManager.lightPrimary,
      elevation: AppSize.s4,
      titleTextStyle:getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ) ,

    ),


    //Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      splashColor: ColorManager.lightPrimary,
      buttonColor:ColorManager.primary,
      height: AppSize.s14,
      disabledColor: ColorManager.gray1,
    ),



    // ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: AppSize.s17,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),



    //TextTheme
    textTheme:  TextTheme(
      headlineLarge: getLightStyle(color: ColorManager.white,fontSize:FontSize.s22),
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGray,fontSize: FontSize.s16),
      titleMedium: getMediumStyle(color:ColorManager.primary,fontSize: FontSize.s16),
      headlineMedium:getMediumStyle(color:ColorManager.darkGray,fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.gray1),
      bodySmall: getRegularStyle(color:ColorManager.gray),
    ),



    //TextFormFiled or //Input Decoration style

    inputDecorationTheme:  InputDecorationTheme(
      contentPadding:const EdgeInsets.all(AppPadding.p8),
      hintStyle:getRegularStyle(color: ColorManager.gray,fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),



      //enabledBorder style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),



      //focusedBorder style
      focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.gray,width: AppSize.s1_5),
        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),



      //error border style
      errorBorder:OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),



      //focusedErrorBorder style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),


  );
}