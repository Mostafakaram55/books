
import 'package:books/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key, this.errorM}) : super(key: key);
  final errorM;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorM,
      style: TextStyle(
        color: ColorManager.white
      ),
    );
  }
}
