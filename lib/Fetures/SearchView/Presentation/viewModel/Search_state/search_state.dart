import 'package:equatable/equatable.dart';

import '../../../../homeView/data/Models/book_model.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SearchBooksInitialState extends SearchBooksState {}

class SearchBooksLoadingState extends SearchBooksState {}

class SearchBooksFailureState extends SearchBooksState {
  final String errorM;
  const SearchBooksFailureState(this.errorM);
}

class SearchBooksSuccessState extends SearchBooksState {
  final List<BookModel> books;//caret list to response data
  const SearchBooksSuccessState(this.books);
}