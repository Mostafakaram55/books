
import 'package:books/Fetures/homeView/presentation/Widgets/best_seller_item.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/newset_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/error_widgets.dart';
import '../../../../core/widgets/shimmer_NewsetBooks_ListView.dart';
import '../viewmodel/newset_books_cubit/newset_books_cubit.dart';
class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(
      builder: (context,state){
      if(state is NewestBooksSuccessState){
        return ListView.builder(
          shrinkWrap: true,
          physics:const  NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context,index)=>Padding(
            padding:  EdgeInsets.symmetric(vertical: AppSize.s4.sp,horizontal: AppSize.s4.sp),
            child: BestSellerListViewItem(
              bookModel: state.books[index],
            ),
          ),
          itemCount: state.books.length,
          scrollDirection: Axis.vertical,
        );
      }else if(state is NewestBooksFailureState){
        return ErrorView(errorM: state.errorM,);
      }else
        {
          return const ShimmerNewsetListView();
       }
      },
    );
  }
}