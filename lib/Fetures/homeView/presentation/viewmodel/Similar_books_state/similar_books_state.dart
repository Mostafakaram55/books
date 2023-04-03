import 'package:equatable/equatable.dart';

import '../../../data/Models/book_model.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
  @override
  List<Object?> get props => [];
}

class SimilarBooksInitialState extends SimilarBooksState{}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksFailureState extends SimilarBooksState {
  final String errorM;
  const SimilarBooksFailureState(this.errorM);
}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;//caret list to response data
  const SimilarBooksSuccessState(this.books);
}


