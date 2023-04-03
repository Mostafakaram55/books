
import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/Fetures/homeView/presentation/Widgets/bookrating.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/textmanager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_indicator/loading_indicator.dart';
class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 235.h,
          width: 175.w,
          child: AspectRatio(
            aspectRatio: 2.7/4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo?.imageLinks!.thumbnail??
                    'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                        colorFilter:
                        const  ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) =>  Center(child: SizedBox(
                  height: 30,
                  width: 30,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballRotateChase, /// Required, The loading type of the widget
                    colors:  [ColorManager.white,],       /// Optional, The color collections
                    strokeWidth: 1,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                    pathBackgroundColor: Colors.black ,
                    pause: false,/// Optional, the stroke backgroundColor
                  ),
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s30.h,
        ),
        BlocBuilder<changAppCubit,ChangeAppState>(
          builder: (context,state){
            return  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.sp),
              child: Text(
                bookModel.volumeInfo!.title??'Not title Found',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: TextManager.fontapp,
                    color:changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                    fontSize: AppSize.s30.sp
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: AppSize.s6.h,
        ),
        Text(
          bookModel.volumeInfo!.authors![0],
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: TextManager.fontapp,
              color: ColorManager.gray,
              fontSize: AppSize.s20.sp
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
       ),
        SizedBox(
          height: AppSize.s8.h,
        ),
        BookRating(
          rating:bookModel.volumeInfo!.averageRating??0,
          count:bookModel.volumeInfo!.ratingsCount??0,
        ),
      ],
    );
  }
}
