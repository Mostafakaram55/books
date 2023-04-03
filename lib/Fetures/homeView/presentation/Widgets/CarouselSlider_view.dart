
import 'package:books/core/resources/routs_manager.dart';
import 'package:books/core/widgets/error_widgets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/widgets/shimmer_fatchedBooks_listView.dart';
import '../viewmodel/fetured_books_cubit/fetured_books_cubit.dart';
import '../viewmodel/fetured_books_cubit/fetured_books_state.dart';
import 'customlistviewitems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
     builder: (context,state){
      if(state is FeaturedBooksSuccessState){
        return CarouselSlider.builder(
          itemCount:state.books.length,
          itemBuilder: (context, index, s)=>InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context,NameRout.detailsRoute,arguments: state.books[index]);
            },
            child: CustomListViewItem(
              imageUrl: state.books[index].volumeInfo!.imageLinks?.thumbnail??
                  'http://ecx.images-amazon.com/images/I/51vZFp-ETML.jpg',
            ),
          ),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1.5,
            viewportFraction: 0.45,
            enlargeCenterPage: true,
          ),
        );
      }else if(state is FeaturedBooksFailureState){
        return ErrorView(errorM: state.errorM,);
      }else{
        return  const ShimmerFatchedBooks();
      }
     },
    );
  }
}
