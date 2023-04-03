import 'package:books/Fetures/homeView/data/repository/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Similar_books_state/similar_books_state.dart';
class SimilarBooksCubit extends Cubit<SimilarBooksState>{
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitialState());
  static SimilarBooksCubit get(BuildContext context )=>BlocProvider.of(context);
  HomeRepo homeRepo;
  Future<void>fetchSimilarBooks({required String category})async
  {
    emit(SimilarBooksLoadingState());
    var data=await homeRepo.fetchSimilarBooks(category: category);
    data.fold((failure) {
      emit(SimilarBooksFailureState(failure.errorM));
    }, (books) {
      emit(SimilarBooksSuccessState(books));
    });
  }

}