import 'package:books/Fetures/homeView/data/Models/book_model.dart';
import 'package:books/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{//tow methods in Home Page but not used ane implementation.
  //(Either) -->( L false(problem), R true(correctly)) :-
  // Because I want here to go back as if it was one of two.
  // If the data came correctly, it would display the data,
  // and if it came wrong, it would display a specific thing.

  //Caret abstract class <Failure> to return Failure Type
  Future<Either<Failure,List<BookModel>>>fetchNewSetBooks();
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimilarBooks({required String category});

}