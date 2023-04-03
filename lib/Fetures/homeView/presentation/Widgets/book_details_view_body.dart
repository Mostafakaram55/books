import 'package:books/Fetures/homeView/presentation/Widgets/Books_details_section.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/changeApp.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/changAppState.dart';
import 'package:books/core/widgets/error_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:books/Fetures/homeView/presentation/Widgets/custom_books_action.dart';
import 'package:books/Fetures/homeView/presentation/Widgets/custom_details_appbar.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/Similar_books_state/similar_books_state.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/Simillar_books_cubit/similar_books_cubit.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/stylemanager.dart';
import '../../../../core/widgets/shimmer_similer_item.dart';
import '../../data/Models/book_model.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key, required this.bookModel,}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const CustomDetailsAppBar(),
              BooksDetailsSection(
                bookModel: bookModel,
              ),
              SizedBox(
                height: AppSize.s17.h,
              ),
               BooksAction(
                 bookModel: bookModel,
               ),
              SizedBox(
                height: AppSize.s24.h,
              ),
              BlocBuilder<changAppCubit,ChangeAppState>(
                builder: (context,state){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You can also like',
                        style: getBoldStyle(
                          color: changAppCubit.get(context).isDark?ColorManager.white:ColorManager.primary,
                          fontSize: AppSize.s17.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: AppSize.s8.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppSize.s8.sp),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height*.15,
                    child: const SimilarListViewItem()
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}







class SimilarListViewItem extends StatelessWidget {
  const SimilarListViewItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context,state){
        if(state is SimilarBooksSuccessState){
          return ListView.builder(
            physics:const BouncingScrollPhysics(),
            itemBuilder:(context,index)=>CustomSimilarItem(
              imageUrl: state.books[index].volumeInfo!.imageLinks?.thumbnail??
                  'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
            ) ,
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
          );
        }else if(state is SimilarBooksFailureState){
          return ErrorView(errorM: state.errorM,);
        }else {
          return const ShimmerSimilerItem();
        }
      },
    );
  }
}

class CustomSimilarItem extends StatelessWidget {
 final String imageUrl;
  const CustomSimilarItem({Key? key,required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 2.8/4,
        child: CachedNetworkImage(
          imageUrl:imageUrl,
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
    ) ;
  }
}














