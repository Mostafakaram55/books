
import 'package:books/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
TextStyle _gettextStyle(double fontSize,FontWeight fontWeight,Color color,){
  return TextStyle(fontSize: fontSize,color: color,fontWeight: fontWeight,);
}

TextStyle getRegularStyle({double fontSize=FontSize.s20,required Color color}){
  return _gettextStyle(fontSize, FontWeighManager.regular ,color );
}
TextStyle getMediumStyle({double fontSize=FontSize.s14,required Color color}){
  return _gettextStyle(fontSize, FontWeighManager.medium, color);
}
TextStyle getBoldStyle({double fontSize=FontSize.s20,required Color color}){
  return _gettextStyle(fontSize, FontWeighManager.bold, color);
}
TextStyle getLightStyle({double fontSize=FontSize.s13,required Color color}){
  return _gettextStyle(fontSize, FontWeighManager.light, color);
}
TextStyle getSemiBoldStyle({double fontSize=FontSize.s15,required Color color}){
  return _gettextStyle(fontSize, FontWeighManager.semiBold, color);
}
TextStyle getFontAppStyle({double fontSize=FontSize.s20,required Color color,fontFamily}){
  return _gettextStyle(fontSize, FontWeighManager.light, color);
}