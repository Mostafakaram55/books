import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorM;
  const FeaturedBooksFailureState(this.errorM);
}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> books;//caret list to response data
   const FeaturedBooksSuccessState(this.books);
}
class ChangModeState extends FeaturedBooksState {}