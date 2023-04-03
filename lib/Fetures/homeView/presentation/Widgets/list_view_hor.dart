
import 'package:books/Fetures/homeView/presentation/Widgets/customlistviewitems.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/fetured_books_cubit/fetured_books_cubit.dart';
import 'package:books/core/resources/color_manager.dart';
import 'package:books/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/error_widgets.dart';
import '../viewmodel/fetured_books_cubit/fetured_books_state.dart';
import 'package:loading_indicator/loading_indicator.dart';
class CustomListViewHorizontal extends StatelessWidget {
  const CustomListViewHorizontal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder:(context,state){
        if(state is FeaturedBooksSuccessState){
           return Padding(
            padding:  EdgeInsets.symmetric(vertical: AppSize.s12.sp),
            child: SizedBox(
              height: 240.w,
              child: ListView.builder(
                physics:const BouncingScrollPhysics(),
                itemBuilder:(context,index)=> CustomListViewItem(
                  imageUrl: state.books[index].volumeInfo!.imageLinks?.thumbnail??
                      'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
                ),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        }else if(state is FeaturedBooksFailureState){
          return  ErrorView(errorM: state.errorM);
        }else{
          return  Center(
            child: SizedBox(
              height: 70,
              width: 50,
              child: LoadingIndicator(
                  indicatorType: Indicator.lineSpinFadeLoader, /// Required, The loading type of the widget
                  colors:  [ColorManager.white,],       /// Optional, The color collections
                  strokeWidth: 1,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                  pathBackgroundColor: Colors.black ,
                pause: false,/// Optional, the stroke backgroundColor
              ),
            ),
          );
        }
      },
    );
  }
}