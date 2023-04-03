
import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/funcation/url_launcher.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 38.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Expanded(
              child: CustomButton(
                textAction: 'Free',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                textColor: ColorManager.black,
                backGroundColor: ColorManager.white,
              )),
          Expanded(
              child: CustomButton(
                onPressed: ()  {
                  LauncherCustomUrl(
                      context,bookModel.volumeInfo!.previewLink!
                  );
                },
                textAction: 'Free preview',
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                textColor: ColorManager.white,
                backGroundColor: ColorManager.freeReviewColor,
              )),
        ],
      ),
    );
  }
}