
import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/resources/routs_manager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/stylemanager.dart';
import '../../../../core/resources/textmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bookrating.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewItem extends StatelessWidget {
  const  BestSellerListViewItem({Key? key, required this.bookModel,}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context,NameRout.detailsRoute,arguments: bookModel);
      },
      child: Padding(
        padding:  EdgeInsets.all(AppSize.s8.sp),
        child: SizedBox(
          height: 125,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2.9/4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
                  child: CachedNetworkImage(
                    imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail??
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
                      height: 15.h,
                      width: 15.w,
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
              SizedBox(
                width: AppSize.s30.w,
              ),
              BlocBuilder<changAppCubit,ChangeAppState>(
                builder: (context,state){
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        SizedBox(
                          width:MediaQuery.of(context).size.width *.5,
                          child: Text(
                            bookModel.volumeInfo!.title?? 'No Title Found Now',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: TextManager.fontapp,
                                color:changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                                fontSize: AppSize.s20.sp
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          bookModel.volumeInfo!.authors![0],
                          style:GoogleFonts.montserrat(
                            textStyle:getSemiBoldStyle(
                                color:changAppCubit.get(context).isDark?ColorManager.gray1:ColorManager.gray1,
                                fontSize: AppSize.s14
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children:  [
                            Text(
                              TextManager.free,
                              style:getBoldStyle(
                                  fontSize: AppSize.s20,
                                  color: changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Image.asset(
                                  AssetsData.freeIcon
                              ),
                            ),
                            const Spacer(),
                            BookRating(
                              rating:bookModel.volumeInfo!.averageRating??0,
                              count:bookModel.volumeInfo!.ratingsCount??0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

