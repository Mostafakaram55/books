import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repo.dart';
import 'fetured_books_state.dart';
class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitialState());

  final HomeRepo homeRepository;

  //caret object from cubit
  static FeaturedBooksCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void>fetchFeatureBooks()async
  {
    emit(FeaturedBooksLoadingState());
    //Either<Failure, List<BookModel>> result;
     var result=await homeRepository.fetchFeaturedBooks();
    result.fold((failure){
      emit(FeaturedBooksFailureState(failure.errorM));
    }, (books) {
      emit(FeaturedBooksSuccessState(books));
    });
  }

}