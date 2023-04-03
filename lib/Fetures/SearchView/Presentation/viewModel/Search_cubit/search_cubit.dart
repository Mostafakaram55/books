import 'package:books/Fetures/SearchView/data/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Search_state/search_state.dart';
class SearchCubit extends Cubit<SearchBooksState>{
  SearchCubit(this.homeRepoSearch):super(SearchBooksInitialState());
  final HomeRepoSearch homeRepoSearch;
  static SearchCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void>getSearch({
  required String titleSearch,
})async
  {
    emit(SearchBooksLoadingState());
    var result=await homeRepoSearch.searchBook(titleSearch:titleSearch);
    return result.fold((failure){
     emit(SearchBooksFailureState(failure.errorM));
   }, (books) {
     emit(SearchBooksSuccessState(books));
       }
   );
  }
  TextEditingController searchController = TextEditingController();
}