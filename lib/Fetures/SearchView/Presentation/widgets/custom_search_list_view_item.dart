import 'package:books/core/resources/routs_manager.dart';
import 'package:lottie/lottie.dart';

import 'package:books/Fetures/SearchView/Presentation/viewModel/Search_cubit/search_cubit.dart';
import 'package:books/Fetures/SearchView/Presentation/viewModel/Search_state/search_state.dart';
import 'package:books/Fetures/homeView/presentation/Widgets/bookrating.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:books/core/widgets/shimmer_NewsetBooks_ListView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/stylemanager.dart';
import '../../../../core/resources/textmanager.dart';
class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchBooksState>(
      builder: (context,state){
        if(state is SearchBooksSuccessState){
          return ListView.builder(
            shrinkWrap: true,
            physics:const  NeverScrollableScrollPhysics(),
            itemBuilder: (context,index)=>InkWell(
              onTap: (){
                Navigator.pushNamed(context, NameRout.detailsRoute,
                    arguments: state.books[index]);
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
                            imageUrl:state.books[index].volumeInfo?.imageLinks!.thumbnail??
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            SizedBox(
                              width:MediaQuery.of(context).size.width *.5,
                              child: Text(
                               state.books[index].volumeInfo!.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: TextManager.fontapp,
                                    color:ColorManager.white,
                                    fontSize: AppSize.s20.sp
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              state.books[index].volumeInfo!.authors![0],
                              style:GoogleFonts.montserrat(
                                textStyle:getSemiBoldStyle(
                                    color: ColorManager.gray1,
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
                                      color: ColorManager.white
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
                                  rating:state.books[index].volumeInfo!.averageRating??0,
                                  count:state.books[index].volumeInfo!.ratingsCount??0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemCount:state.books.length ,
          );
        }else if(state is SearchBooksFailureState){
          return Container();
        }else if(state is SearchBooksLoadingState){
          return const ShimmerNewsetListView();
        }else{
          return  Center(
            child: SizedBox(
              height: 150.h,
              child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_tnrzlN.json',
              ),
            ),
          );
        }
      },
    );
  }
}
