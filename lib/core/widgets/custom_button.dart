
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/stylemanager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.backGroundColor, required this.textColor, required this.borderRadius, required this.textAction, this.onPressed,}) : super(key: key);
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final String textAction;
  final void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s45.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape:RoundedRectangleBorder(
            borderRadius:  borderRadius,
          ),
        ),
          onPressed: onPressed,
          child:Text(
            textAction,
            style: getBoldStyle(
              color: textColor,
              fontSize: AppSize.s20.sp
            ),
          )
      ),
    );
  }
}
