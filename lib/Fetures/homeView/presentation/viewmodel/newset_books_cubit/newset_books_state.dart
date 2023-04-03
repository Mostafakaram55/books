import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:equatable/equatable.dart';
abstract class NewestBooksState extends Equatable {
  const NewestBooksState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NewestBooksInitialState extends NewestBooksState{}
class NewestBooksLoadingState extends NewestBooksState{}
class NewestBooksFailureState extends NewestBooksState{
  final String errorM;

  const NewestBooksFailureState(this.errorM);
}
class NewestBooksSuccessState extends NewestBooksState{
  final List <BookModel>books;
 const  NewestBooksSuccessState(this.books);
}