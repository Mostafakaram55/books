import 'package:books/Fetures/homeView/data/repository/home_repo.dart';
import 'package:books/Fetures/homeView/presentation/viewmodel/newset_books_cubit/newset_books_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.homeRepo): super(NewestBooksInitialState());
  final HomeRepo homeRepo;
  static NewestBooksCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void>fetchNewestBooks()async
  {
    emit(NewestBooksLoadingState());
    var result=await homeRepo.fetchNewSetBooks();
    result.fold((failure) {
      emit(NewestBooksFailureState(failure.errorM));
    }, (books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}